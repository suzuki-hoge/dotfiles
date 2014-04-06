#-*- coding: utf-8 -*-

import subprocess

from Log import Log

class Parser:

	def __init__(self, options):
		self.options = options
		fetchLines = self._fetch(options['num'])
		self.logs = self._createLogs(fetchLines)

	def _fetch(self, num):
		fetchLines = subprocess.Popen(['git', 'log', num, '--date=rfc', '--pretty=format:info_start%nhash:%H%nname:%cn%nabs_date:%cd%nrel_date:%cr%nsubject:%s', '--stat'], stdout = subprocess.PIPE).stdout

		return [line.strip() for line in fetchLines]

	def _createLogs(self, lines):
		logs = []
		for line in lines:
			if line == 'info_start':
				try:
					logs.append(log)
				except:
					pass
				log = Log()
			elif line == lines[-1]:
				logs.append(log)
			else:
				log.addLine(line)

		return [log.parse() for log in logs]

	def output(self):
		[log.output(self.options) for log in self.logs]
