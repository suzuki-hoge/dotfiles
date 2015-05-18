import os

def name_guide():
    inputted = raw_input('\nname:  ')
    if inputted != '':
	return inputted
    else:
	name_guide()


def box_guide():
    boxes = filter(lambda name: name != '.DS_Store', os.listdir('%s/.vagrant.d/boxes/' % os.environ['HOME']))

    print '\n',
    for i, box in enumerate(boxes):
	print '%d %s' % (i, box)

    inputted = raw_input('\nbox (leave blank to use new box and box_url):  ')

    if inputted == '':
	box_name = raw_input('\nbox name:  ')
	box_url = raw_input('\nbox url:   ')
    else:
	try:
	    box_name = boxes[int(inputted)]
	    box_url = ''
	except IndexError:
	    box_name, box_url = box_guide()

    return box_name, box_url


def forwarding_guide(guests = [], hosts = []):
    def _forwarding_guest_guide():
	inputted = raw_input('\nguest forwarded port (leave blank to go next configure): ')
	return inputted

    def _forwarding_host_guide():
	inputted = raw_input('\nhost forwarded port: ')
	return inputted if inputted != '' else _forwarding_host_guide()

    inputed_guest = _forwarding_guest_guide()

    if inputed_guest == '':
	return zip(guests, hosts)
    else:
	inputed_host = _forwarding_host_guide()
	guests.append(inputed_guest)
	hosts.append(inputed_host)
	return forwarding_guide(guests, hosts)


def private_ip_guide():
    inputted = raw_input('\nprivate network ip (leave blank to go next configure): ')
    return inputted


def provision_guide():
    inputted = raw_input('\nprovision shell path (leave blank to go next configure): ')
    return inputted


def spec_guide():
    inputted = raw_input('\nspec customize? y/n: ')

    if inputted == 'y':
	def memory_guide():
	    inputted = raw_input('\nmemory (MB): ')
	    return inputted if inputted != '' else memory_guide()

	def cpus_guide():
	    inputted = raw_input('\ncpus: ')
	    return inputted if inputted != '' else cpus_guide()

	spec = {'memory' : memory_guide(), 'cpus' : cpus_guide()}
	return spec
    if inputted == 'n':
	return {}
    else:
	return spec_guide()
