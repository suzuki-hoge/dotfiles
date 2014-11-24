from Entry import Entry

class Manager:

	def __init__(self, path):
		Entry.id = 0
		Entry.root = path

		node = Entry(path)
		listnode = node.toList()

		self.head = self.__head(path)
		self.tree = '\n'.join([entries[0].output(entries[1]) for entries in zip(listnode, listnode[1:] + [None])])
		self.full = '\n'.join([e.full for e in listnode])

	def __head(self, path):
		bar = '-' * len(path)
		return '%s\n%s\n%s' % (bar, path, bar)

	def __byList(self, node, func):
		return node.byList(func, [])

	def find(self, ids):
		return '\n'.join([self.full[int(id)] for id in ids])


if __name__ == '__main__':
	m = Manager('/Users/ryo/Development/brass/src/brass/static/css')
	for t in m.tree:
		print t
