#-*- coding: utf-8 -*-

import os
import re
from email.utils import parsedate

class Log:

	KEY_HASH      = 'hash:'
	KEY_COMMITTER = 'committer:'
	KEY_ABS_DATE  = 'abs_date:'
	KEY_REL_DATE  = 'rel_date:'
	KEY_SUBJECT   = 'subject:'

	def __init__(self):
		self.lines = []

		self.hash    = None
		self.committer    = None
		self.absDate = None
		self.relDate = None
		self.subject = None
		self.files   = []

	def addLine(self, line):
		self.lines.append(line)

	def parse(self):
		for line in self.lines:
			if line.startswith(Log.KEY_HASH):
				self.hash = line[len(Log.KEY_HASH):]

			elif line.startswith(Log.KEY_COMMITTER):
				self.committer = line[len(Log.KEY_COMMITTER):]

			elif line.startswith(Log.KEY_ABS_DATE):
				p = parsedate(line[len(Log.KEY_ABS_DATE):])
				self.ymd = '%04d/%02d/%02d' % (int(p[0]), int(p[1]), int(p[2]))
				self.hms = '%02d:%02d:%02d' % (int(p[3]), int(p[4]), int(p[5]))

			elif line.startswith(Log.KEY_REL_DATE):
				self.rel = line[len(Log.KEY_REL_DATE):]

			elif line.startswith(Log.KEY_SUBJECT):
				self.subject = line[len(Log.KEY_SUBJECT):]

			elif line.strip() == '' or re.search('\d+ files? changed,', line):
				pass

			else:
				self.files.append(line)

		return self
