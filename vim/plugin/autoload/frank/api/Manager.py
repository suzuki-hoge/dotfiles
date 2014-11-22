from Entry import Entry

class Manager:

	def __init__(self, path):
		Entry.id = 0
		Entry.root = path

		node = Entry(path)

		self.head = self.__header(path)
		self.tree = '\n'.join(self.__byList(node, Entry._tree))
		self.full = self.__byList(node, Entry._full)

	def __header(self, path):
		bar = '-' * len(path)
		return '%s\n%s\n%s' % (bar, path, bar)

	def __byList(self, node, func):
		return node.byList(func, [])

	def find(self, ids):
		return '\n'.join([self.full[id] for id in ids])
