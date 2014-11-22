import sys

import shelve

from Manager import Manager

SHELF = './shelf'

def header(path):
	print Manager.header(path)

def tree(path):
	shelf = shelve.open(SHELF)

	try:
		manager = shelf[path]
	except:
		manager = Manager(path)

		shelf[path] = manager
		shelf.close()

	manager.output()

if __name__ == '__main__':

	mode = sys.argv[1]
	path = sys.argv[2]

	if mode == 'header':
		header(path)
	elif mode == 'tree':
		tree(path)

