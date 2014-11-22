import os.path

class Entry:

	def __init__(self, path):
		self.path = path
		self.name = os.path.basename(path)
		self.depth = path.count(os.path.sep) - Entry.root.count(os.path.sep)
		self.subs = self.__get(path)

	def __get(self, path):
		if os.path.isfile(path):
			return []
		return [Entry('%s/%s' % (path, subname)) for subname in os.listdir(path)]

	def output(self):
		indent = '    ' * self.depth
		slash = ' /'[os.path.isdir(self.path)]
		print '%s%s%s' % (indent, self.name, slash)
		[e.output() for e in self.subs]
