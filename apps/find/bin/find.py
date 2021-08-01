#!/usr/bin/python

import os
import sys
import argparse

parser = argparse.ArgumentParser(description = "formatted safe find")

parser.add_argument('path', action = 'store', help = 'root path')

type_group = parser.add_mutually_exclusive_group()
type_group.add_argument('-f', '--file-only', action = 'store_true')
type_group.add_argument('-d', '--directory-only', action = 'store_true')

parser.add_argument('-r', '--recursive', default = False, action = 'store_true')

args = parser.parse_args()


is_d = os.path.isdir
is_f = lambda x: not is_d(x)
join = os.path.join

blacks = ['.git', '.svn', '.vagrant', 'idea', '.DS_Store', '.pyc', '.cabal-sandbox', '.stack-work', '.gradle', '.cache', 'node_modules']
limit = 10000

result = []
allow_file = not args.directory_only
allow_directory = not args.file_only
recursively = args.recursive


def find_as_full_path(path):
    return [join(path, x) for x in os.listdir(path)]


def is_white(path):
    return not any([path.endswith(black) for black in blacks])


def find(path):
    if len(result) > limit:
        print 'over %d counts.' % limit
        sys.exit(2)

    found = find_as_full_path(path)
    files = filter(is_f, found)
    directories = filter(is_white, filter(is_d, found))

    if allow_file:
        result.extend(files)
    if allow_directory:
        result.extend(directories)

    if recursively:
        map(find, directories)


if not os.path.exists(args.path):
    print 'no such path.'
    sys.exit(1)

find(args.path)

drop_len = len(args.path) + 1
for e in result:
    print e[drop_len:]
