require 'json'

def inspect_image(image, arm)
  manifest = JSON.load(`DOCKER_CLI_EXPERIMENTAL=enabled; docker manifest inspect --verbose #{image}`)

  platforms = (manifest.instance_of?(Array) ? manifest : [manifest])
                .map { |v| %w[os architecture variant].map { |key| v['Descriptor']['platform'][key] }.compact.join('/') }
                .map { |s| s == 'linux/amd64' ? 'amd64' : s == 'linux/arm64/v8' ? 'arm64' : nil }
                .compact
                .sort

  platform_option = arm && platforms == ['amd64'] ? '--platform=linux/amd64 ' : ''
  pulled = `docker image history #{image} 2>&1`.start_with?('IMAGE')

  unless pulled
    `docker image pull #{platform_option}#{image} > /dev/null 2>&1`
  end

  histories = `docker image history --no-trunc #{image}`.split("\n")

  entrypoint_p = Regexp.new('ENTRYPOINT \[(.*)\]')
  entrypoint = histories
                 .filter { |s| s.include?('ENTRYPOINT') }
                 .map { |s| entrypoint_p.match(s)[1].gsub('"', '').gsub(', ', ' ') }
                 .first || ''

  cmd_p = Regexp.new('CMD \[(.*)\]')
  cmd = histories
          .filter { |s| s.include?('CMD') }
          .map { |s| cmd_p.match(s)[1].gsub('"', '').gsub(', ', ' ') }
          .first || ''

  [platforms, platform_option, pulled, entrypoint, cmd]
end

def inspect_container(image, platform_option)
  container_out = `docker container run #{platform_option}--rm --user root --entrypoint sh #{image} -c 'cat /etc/shells; echo -1-; grep -h -w ID /etc/*-release; echo -2-; ls \`echo $PATH | tr : " "\` 2> /dev/null'`.split("\n")

  shells = container_out.take_while { |s| s != '-1-' }
  shell = shells.filter { |s| s.include?('/bash') }.empty? ? 'sh' : 'bash'

  releases_id = container_out.reverse.take_while { |s| s != '-1-' }.reverse.take_while { |s| s != '-2-' }
  os = releases_id == [] ? 'unknown' : releases_id[0].split('=')[1].gsub(/'/, '').gsub(/"/, '')

  bins = container_out.reverse.take_while { |s| s != '-2-' }
  package_managers = %w[yum dnf microdnf apt apk].filter { |c| bins.include?(c) }

  commands = package_managers.flat_map { |pm|
    case pm
    when 'yum', 'dnf', 'microdnf', 'apt' then
      %w[update install].map { |s| "#{pm} #{s}" }
    when 'apk'
      %w[update add].map { |s| "#{pm} #{s}" }
    end
  }

  [shell, os, commands]
end

for image in ARGV
  platforms, platform_option, pulled, entrypoint, cmd = inspect_image(image, `sysctl machdep.cpu.brand_string`.include?('Apple'))
  shell, os, commands = inspect_container(image, platform_option)

  puts JSON.pretty_generate(
    {
      'image': {
        'name': image,
        'platforms': platforms,
        'entrypoint': entrypoint,
        'cmd': cmd
      },
      'container': {
        'os': os,
        'shell': shell,
        'commands': commands
      },
      'docker': {
        'manifest': "DOCKER_CLI_EXPERIMENTAL=enabled; docker manifest inspect --verbose #{image}",
        'image': "docker image inspect #{image}",
        'layers': "docker image history --no-trunc #{image}",
        'entry': "docker container run #{platform_option}--rm --user root --interactive --tty --entrypoint=#{shell} #{image}",
        'service': "#{entrypoint} #{cmd}".strip
      },
      'log': {
        'operations': [platform_option == '' ? nil : 'amd64 specified', pulled ? nil : 'image pulled'].compact
      }
    }
  )
end

