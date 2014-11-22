from Entry import Entry

class Manager:

	def __init__(self, path):
		Entry.id = 0
		Entry.root = path

		node = Entry(path)

		self.header = self.__header(path)
		self.tree = self.__byList(node, Entry._tree)
		self.full = self.__byList(node, Entry._full)

	def __header(self, path):
		bar = '-' * len(path)
		return '%s\n%s\n%s' % (bar, path, bar)

	def __byList(self, node, func):
		return node.byList(func, [])

	def findOne(self, id):
		return self.full[id]

if __name__ == '__main__':
	path = '/Users/ryo/Documents/tmp/entries-sample'

	manager = Manager(path)
	print manager.findOne(5)
