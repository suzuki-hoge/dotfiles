import os.path

class Entry:

	def __init__(self, path):
		self.full = os.path.join(Entry.root, path)
		self.path = path
		self.name = os.path.basename(path)
		self.depth = path.count(os.path.sep) - Entry.root.count(os.path.sep)
		self.subs = self.__get(path)

	def __get(self, path):
		if os.path.isfile(path):
			return []
		return [Entry('%s/%s' % (path, subname)) for subname in os.listdir(path)]

	def output(self, next):
		indent = '    ' * self.depth
		slash = ['', '/{'][os.path.isdir(self.path)]
		mark = '}' * (self.depth - next.depth) if next is not None else '}' * self.depth
		return '%s%s%s%s' % (indent, self.name, slash, mark)

	def toList(self, acm = []):
		acm.append(self)
		[e.toList(acm) for e in self.subs]
		return acm
