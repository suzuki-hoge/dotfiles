import subprocess

def getStdout(command):
	return subprocess.Popen(command.split(), stdout = subprocess.PIPE).stdout.read().strip()

def getCurrentBranch():
	return getStdout('git rev-parse --abbrev-ref HEAD')

def getRootDir():
	return getStdout('git rev-parse --show-toplevel')
