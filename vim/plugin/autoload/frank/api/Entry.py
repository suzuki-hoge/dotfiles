import os.path

class Entry:

	def __init__(self, path):
		self.full = os.path.join(Entry.root, path)
		self.path = path
		self.name = os.path.basename(path)
		self.depth = path.count(os.path.sep) - Entry.root.count(os.path.sep) - 1
		self.subs = self.__get(path)

	def __get(self, path):
		if os.path.isfile(path):
			return []
		return [Entry('%s/%s' % (path, subname)) for subname in os.listdir(path)]

	def output(self, next):
		indent = '    ' * self.depth
		slash = ['', '/{'][os.path.isdir(self.path)]
		mark = self.__mark(next)
		return '%s%s%s%s' % (indent, self.name, slash, mark)

	def __mark(self, next):
		if next is None:
			return '}' * self.depth
		else:
			return '}' * (self.depth - next.depth)

	def toList(self, acm = []):
		acm.append(self)
		[e.toList(acm) for e in self.subs]
		return acm
