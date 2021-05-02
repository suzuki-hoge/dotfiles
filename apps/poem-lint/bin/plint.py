#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys, commands, itertools

import defs


def check(path):
    print '\n%s' % path
    for (black, white) in defs.pairs:
        lines = filter(str.strip, commands.getoutput("grep -n '%s' %s" % (black, path)).split('\n'))
        for line in lines:
            print '    %s → %s' % (line.replace(black, '\033[31m%s\033[0m' % black), '\033[32m%s\033[0m' % white)


def book():
    with open('./config.yaml', 'r') as f:
        paths = ['config.yaml'] + [line.strip().replace('- ', '') + '.md' for line in itertools.dropwhile(lambda line: 'chapters' not in line, f.read().splitlines()) if line][1:]

    for path in paths:
        check(path)


def article(path):
    check(path)


if __name__ == '__main__':
    if len(sys.argv) == 2:
        article(sys.argv[1])
    else:
        book()

