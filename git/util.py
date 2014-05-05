import subprocess

def getStdout(command):
	return subprocess.Popen(command.split(), stdout = subprocess.PIPE).stdout

def getStdoutString(command):
	return getStdout(command).read().strip()

def getStdoutList(command):
	return getStdout(command)

def getCurrentBranch():
	return getStdoutString('git rev-parse --abbrev-ref HEAD')

def getRootDir():
	return getStdoutString('git rev-parse --show-toplevel')
