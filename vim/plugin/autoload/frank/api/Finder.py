import sys
import os.path

import shelve
import argparse

from Manager import Manager

parser = argparse.ArgumentParser(description = "used by frank", add_help = False)
parser.add_argument('path', action = 'store', help = 'path')
parser.add_argument('ids', action = 'store', nargs = '*', default = [], help = 'target ids at --find (default : [])')
parser.add_argument('-r', default = False, action = 'store_true', help = 'not use shelf (default : false)')

page_group = parser.add_mutually_exclusive_group()
page_group.add_argument('-h', '--head', default = False, action = 'store_true', help = 'get head')
page_group.add_argument('-t', '--tree', default = False, action = 'store_true', help = 'get tree')
page_group.add_argument('-f', '--find', default = False, action = 'store_true', help = 'find by ids')

args = parser.parse_args()

def getManager(path, isRecreate):
	return recreate(path) if isRecreate else byShelf(path)

def byShelf(path):
	dbpath = os.path.join(os.path.dirname(__file__), 'shelf')
	shelf = shelve.open(dbpath)

	try:
		manager = shelf[path]
	except:
		manager = recreate(path)

		shelf[path] = manager
		shelf.close()

	return manager

def recreate(path):
	return Manager(path)

path = args.path
ids = args.ids

manager = getManager(path, args.r)

if args.head:
	print manager.head

if args.tree:
	print manager.tree

if args.find:
	print manager.find(ids)
