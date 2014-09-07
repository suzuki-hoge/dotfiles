import re

class Dispatch:

	@staticmethod
	def isEn(text):
		return re.match(r'^[A-Za-z]+$', text) != None
