import re
import sys

import urllib2

from Token import Token
from AccessInfo import AccessInfo

class Translator:

	def __init__(self, _from, _to, _text):
		self._from = _from
		self._to = _to
		self._text = re.sub(r' ', r'+', _text)

	def execute(self):
		token = Token.get()
		apiResult = self.translate(token)

		result = self.parseXml(apiResult)

		return result

	def translate(self, token):
		url = AccessInfo.Translator.Url(self._from, self._to, self._text)
		header = AccessInfo.Translator.Header(token)

		request = urllib2.Request(url)
		request.add_header(*header)

		try:
			response = urllib2.urlopen(request, timeout = 3)

		except Exception as e:
			print 'translator connection error'
			sys.exit()

		return response.read()

	def parseXml(self, string):
		return re.sub(r'<[^>]*>', '', string)
