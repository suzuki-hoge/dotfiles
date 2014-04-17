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

def _outputInDetailWithFiles(logs):
	for log in logs:
		print '%s' % ('-' * 80)

		print 'hash      : %s'    % log.hash
		print 'committer : %s'    % log.committer
		print 'datetime  : %s %s' % (log.ymd, log.hms)
		print 'rel date  : %s'    % log.rel
		print 'subject   : %s'    % log.subject

		print '\nfiles'
		if log.files:
			for file in log.files:
				print '  %s' % file
		else:
			print '  -'

		print ' '

def _outputInDetail(logs):
	for log in logs:
		print '%s' % ('-' * 80)

		print 'hash      : %s'    % log.hash
		print 'committer : %s'    % log.committer
		print 'datetime  : %s %s' % (log.ymd, log.hms)
		print 'rel date  : %s'    % log.rel
		print 'subject   : %s'    % log.subject

		print ' '

def _outputSimply(logs):
	maxlen = 0
	for log in logs:
		if maxlen < len(log.committer):
			maxlen = len(log.committer)

	for i, log in enumerate(logs):
		if log.ymd != logs[i - 1].ymd or i == 0:
			print '\n%s' % log.ymd
		print '  %s - %s' % (log.committer.ljust(maxlen, ' '), log.subject)
