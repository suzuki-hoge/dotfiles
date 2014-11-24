from Entry import Entry

class Manager:

	def __init__(self, path):
		Entry.id = 0
		Entry.root = path

		node = Entry(path)
		listnode = node.toList()

		self.head = self.__head(path)
		self.tree = self.__tree(listnode)
		self.full = self.__full(listnode)

	def __head(self, path):
		bar = '-' * len(path)
		list = [bar, path, bar, '']

		return self.__join(list)

	def __tree(self, listnode):
		entries = listnode[1:]
		nexts   = listnode[2:] + [None]
		list = [entry.output(next) for entry, next in zip(entries, nexts)]

		return self.__join(list)

	def __full(self, listnode):
		return [entry.full for entry in listnode]

	def __join(self, list):
		return '\n'.join(list)

	def find(self, ids):
		return self.__join([self.full[int(id)] for id in ids])
