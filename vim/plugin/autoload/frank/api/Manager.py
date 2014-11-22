from Entry import Entry

class Manager:

	def __init__(self, path):
		Entry.root = path
		self.node = Entry(path)

	def output(self):
		self.node.output()

	@staticmethod
	def header(path):
		bar = '-' * len(path)
		return '%s\n%s\n%s' % (bar, path, bar)

# todo numner
# todo {}
if __name__ == '__main__':
	path = '/Users/ryo/Documents/tmp/entries-sample'

	manager = Manager(path)
	manager.output()