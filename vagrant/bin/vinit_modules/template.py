def vagrantfile(name, box_name, box_url, forwardings, private_ip, provision_path, spec):
    name_line = format("vbox.name = '%s'", name)

    box_name_line = format("\n  config.vm.box = '%s'", box_name)

    box_url_line  = format_or("\n  config.vm.box_url = '%s'", box_url, '')

    forwarding_lines = ''.join([format("\n  config.vm.network :forwarded_port, guest: %(guest)s, host: %(host)s", locals()) for guest, host in forwardings])
    forwarding_lines = forwarding_lines if forwarding_lines else 'no line'

    private_ip_line = format_or("\n  config.vm.network :private_network, ip: '%s'", private_ip)

    provision_path_line  = format_or("\n  config.vm.provision :shell, :path => '%s'", provision_path)

    spec_line = format_or("\n  config.vm.provider :virtualbox do |vb|\n    vb.customize ['modifyvm', :id, '--memory', '%(memory)s', '--cpus', '%(cpus)s', '--ioapic', 'on']\n  end", spec)

    return _template(name_line, box_name_line, box_url_line, forwarding_lines, private_ip_line, provision_path_line, spec_line)


def format(_format, _value):
    return _format % _value


def format_or(_format, _value, _or = 'no line'):
    return _format % _value if _value else _or

def _template(name_line, box_name_line, box_url_line, forwarding_lines, private_ip_line, provision_path_line, spec_line):
    line = """# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider :virtualbox do |vbox|
    %(name_line)s
  end
  %(box_name_line)s%(box_url_line)s
  %(forwarding_lines)s
  %(private_ip_line)s
  %(provision_path_line)s
  %(spec_line)s
end""" % locals()
    lines = line.split('\n')
    return '\n'.join(filter(lambda line: 'no line' not in line, line.split('\n')))
