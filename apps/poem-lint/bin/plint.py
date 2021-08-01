#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys, commands, yaml

import defs


def check(path):
    print '\n%s' % path
    for (warning, suggest, excludes) in defs.pairs:
        lines = filter(str.strip, commands.getoutput("grep -n '%s' %s" % (warning, path)).split('\n'))
        for line in lines:
            if any([exclude in line for exclude in excludes]):
                pass
            else:
                print '    %s → %s' % (line.replace(warning, '\033[31m%s\033[0m' % warning), '\033[32m%s\033[0m' % suggest)


def book():
    with open('./config.yaml', 'r') as f:
        paths =  ['config.yaml'] + ['%s.md' % chapter for chapter in yaml.safe_load(f)['chapters']]

    for path in paths:
        check(path)


def article(path):
    check(path)


if __name__ == '__main__':
    if len(sys.argv) == 2:
        article(sys.argv[1])
    else:
        book()

