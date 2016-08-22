import sys
sys.dont_write_bytecode = True

import commands

def get_current_branch():
	return commands.getoutput('git rev-parse --abbrev-ref HEAD')

def get_root_dir():
	return commands.getoutput('git rev-parse --show-toplevel')

def get_owner():
	remote_url = commands.getoutput('grep "url =" %s/.git/config' % get_root_dir())
	if 'git@' in remote_url:
		return remote_url.split(':')[1].split('/')[0]
	else:
		return remote_url.split('/')[3]

def get_repository():
	remote_url = commands.getoutput('grep "url =" %s/.git/config' % get_root_dir())
	return remote_url.split('/')[-1][:-4]
