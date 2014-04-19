import subprocess

from Log import Log

def execute(options):
	return _fetch(options['num'])

def _fetch(num):
	fetched = subprocess.Popen(['git', 'log', num, '--date=rfc', '--pretty=format:info_start%nhash:%H%ncommitter:%cn%nabs_date:%cd%nrel_date:%cr%nsubject:%s', '--stat'], stdout = subprocess.PIPE).stdout

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

def output(logs, options):
	if options['files']:
		_outputInDetailWithFiles(logs)

	elif options['detail']:
		_outputInDetail(logs)

	else:
		_outputSimply(logs)

def _outputBeginLine():
	print '%s' % ('-' * 80)

def _outputEndLine():
	print ' '

def _outputInDetailWithFiles(logs):
	for log in logs:
		_outputBeginLine()
		log.outputDetailInfo()
		log.outputFiles()
		_outputEndLine()

def _outputInDetail(logs):
	for log in logs:
		_outputBeginLine()
		log.outputDetailInfo()
		_outputEndLine()

def _outputDateOrNone(i, logs):
	if logs[i].ymd != logs[i - 1].ymd or i == 0:
		print '\n%s' % logs[i].ymd

def _outputSimply(logs):
	maxCommitterLength = len(max(logs, key = lambda log: log.committer).committer)

	for i, log in enumerate(logs):
		_outputDateOrNone(i, logs)
		log.outputInfo(maxCommitterLength)
