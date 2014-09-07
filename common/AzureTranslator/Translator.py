import urllib2
import re

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
		response = urllib2.urlopen(request)

		return response.read()

	def parseXml(self, string):
		return re.sub(r'<[^>]*>', '', string)

t = Translator('en', 'ja', 'apple')
print t.execute()
