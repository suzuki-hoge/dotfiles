import sys
sys.dont_write_bytecode = True

import commands

def getCurrentBranch():
	return commands.getoutput('git rev-parse --abbrev-ref HEAD')

def getRootDir():
	return commands.getoutput('git rev-parse --show-toplevel')

def getOwner():
	remote_url = commands.getoutput('grep "url =" %s/.git/config' % getRootDir())
	if 'git@' in remote_url:
		return remote_url.split(':')[1].split('/')[0]
	else:
		return remote_url.split('/')[3]

def getRepository():
	remote_url = commands.getoutput('grep "url =" %s/.git/config' % getRootDir())
	return remote_url.split('/')[-1][:-4]
