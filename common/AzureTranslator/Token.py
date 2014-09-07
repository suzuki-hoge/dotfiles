# -*- coding: utf-8 -*-

import urllib
import urllib2
import json
import re

import os.path
import os
import datetime

from AccessInfo import AccessInfo

class Token:

	StoredTokenPath = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'stored-token.txt')

	@staticmethod
	def get():
		if Token.__isTooOld():
			return Token.__fromServer()
		else:
			return Token.__fromStored()

	@staticmethod
	def __isTooOld():
		return True
		last = Token.__getLastUpdateAt()
		now = Token.__getNow()

		diff = (now - last).total_seconds()
		return 600 < diff 

	@staticmethod
	def __getLastUpdateAt():
		last = os.stat(Token.StoredTokenPath).st_mtime
		return datetime.datetime.fromtimestamp(last)

	@staticmethod
	def __getNow():
		return datetime.datetime.today()

	@staticmethod
	def __fromServer():
		params = urllib.urlencode(AccessInfo.Token.Params)
		request = urllib2.Request(AccessInfo.Token.Url, params)
		response = urllib2.urlopen(request)
		jsonData = json.loads(response.read())

		token = jsonData[AccessInfo.Token.Key]

		Token.__store(token)

		return token

	@staticmethod
	def __fromStored():
		_file = open(Token.StoredTokenPath, 'r')

		return _file.readline()

	@staticmethod
	def __store(token):
		_file = open(Token.StoredTokenPath, 'w')

		_file.write(token)
		_file.close()

print Token.get()
