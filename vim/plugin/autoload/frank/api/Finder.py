import sys
import os.path

import shelve

from Manager import Manager

SHELF = os.path.join(os.path.dirname(__file__), 'shelf')

#todo : force
def getManager(path):
	shelf = shelve.open(SHELF)

	try:
		manager = shelf[path]
	except:
		manager = Manager(path)

		shelf[path] = manager
		shelf.close()

	return manager

if __name__ == '__main__':

	mode = sys.argv[1]
	path = sys.argv[2]

	manager = getManager(path)

	if mode == 'header':
		print manager.header

	elif mode == 'tree':
		print '\n'.join(manager.tree)

	elif mode == 'findOne':
		id = int(sys.argv[3])
		print manager.findOne(id)
