import sys

import shelve

from Manager import Manager

path = sys.argv[1]

shelf = shelve.open('./shelf')

try:
	manager = shelf[path]
except:
	manager = Manager(path)

manager.output()
