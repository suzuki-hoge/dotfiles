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

	def _tree(e):
		indent = '    ' * e.depth
		slash = ' /'[os.path.isdir(e.path)]
		return '%s%s%s' % (indent, e.name, slash)

	def _full(e):
		return e.full

	def byList(self, func, acm):
		acm.append(func(self))
		[e.byList(func, acm) for e in self.subs]
		return acm
