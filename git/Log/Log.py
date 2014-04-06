#-*- coding: utf-8 -*-

import os
import re
from email.utils import parsedate

class Log:

	def __init__(self):
		self.lines = []

		self.hash    = None
		self.name    = None
		self.absDate = None
		self.relDate = None
		self.subject = None
		self.files   = []

	def addLine(self, line):
		self.lines.append(line)

	def parse(self):
		for line in self.lines:
			if line.startswith('hash:'):
				self.hash = line[5:]

			elif line.startswith('name:'):
				self.name = line[5:]

			elif line.startswith('abs_date:'):
				p = parsedate(line[9:])
				self.absDate = '%04d/%02d/%02d %02d:%02d:%02d' % (int(p[0]), int(p[1]), int(p[2]), int(p[3]), int(p[4]), int(p[5]))

			elif line.startswith('rel_date:'):
				self.relDate = line[9:]

			elif line.startswith('subject:'):
				self.subject = line[8:]

			elif line.strip() == '' or re.search('\d+ files? changed,', line):
				pass

			else:
				self.files.append(line)

		return self

	def output(self, options):
		print '%s' % ('-' * 99)

		if options['hash']:
			print 'hash    : %s' % self.hash
		print 'name    : %s' % self.name
		print 'absDate : %s' % self.absDate
		print 'relDate : %s' % self.relDate
		print 'subject : %s' % self.subject

		if options['diff']:
			for line in self.files:
				print '  %s' % line

		if options['full']:
			head = os.getcwd()
			for line in self.files:
				print '  %s/%s' % (head, line)

		print ' '
