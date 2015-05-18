def vagrantfile(name, box_name, box_url, forwardings, private_ip, provision_path, spec):
    name_line = "vbox.name = '%s'" % name

    box_name_line = "\n  config.vm.box = '%s'" % box_name
    box_url_line  = "\n  config.vm.box_url = '%s'" % box_url if box_url != '' else 'no line'

    forwarding_lines = ''.join(["\n  config.vm.network :forwarded_port, guest: %(guest)s, host: %(host)s" % locals() for guest, host in forwardings]) if forwardings != [] else 'no line'

    private_ip_line = "\n  config.vm.network :private_network, ip: '%s'" % private_ip if private_ip != '' else 'no line'

    provision_path_line  = "\n  config.vm.provision :shell, :path => '%s'" % provision_path if provision_path != '' else 'no line'

    spec_line = "\n  config.vm.provider :virtualbox do |vb|\n    vb.customize ['modifyvm', :id, '--memory', '%(memory)s', '--cpus', '%(cpus)s', '--ioapic', 'on']\n  end" % spec if spec != {} else 'no line'

    return _template(name_line, box_name_line, box_url_line, forwarding_lines, private_ip_line, provision_path_line, spec_line)


def _template(name_line, box_name_line, box_url_line, forwarding_lines, private_ip_line, provision_path_line, spec_line):
    line = """# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider :virtualbox do |vbox|
    %(name_line)s
  end
  %(box_name_line)s
  %(box_url_line)s
  %(forwarding_lines)s
  %(private_ip_line)s
  %(provision_path_line)s
  %(spec_line)s
end""" % locals()
    lines = line.split('\n')
    return '\n'.join(filter(lambda line: 'no line' not in line, line.split('\n')))
