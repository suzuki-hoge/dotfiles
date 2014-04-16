import subprocess

from Log import Log

def execute(options):
	return _fetch(options['num'])

def _fetch(num):
	fetched = subprocess.Popen(['git', 'log', num, '--date=rfc', '--pretty=format:info_start%nhash:%H%nname:%cn%nabs_date:%cd%nrel_date:%cr%nsubject:%s', '--stat'], stdout = subprocess.PIPE).stdout

	return [line.strip() for line in fetched]

def parse(fetched):
	return _createLogs(fetched)

def _createLogs(fetched):
	logs = []
	for line in fetched:
		if line == 'info_start':
			try:
				logs.append(log)
			except:
				pass
			log = Log()
		elif line == fetched[-1]:
			logs.append(log)
		else:
			log.addLine(line)

	return [log.parse() for log in logs]

# name -> commiter
# relDate???
# ymd only??? hm???
def output(logs):
	maxlen = 0
	for log in logs:
		if maxlen < len(log.name):
			maxlen = len(log.name)

	for i, log in enumerate(logs):
		if log.ymd != logs[i - 1].ymd or i == 0:
			print '\n%s' % log.ymd
		print '  %s - %s' % (log.name.ljust(maxlen, ' '), log.subject)
