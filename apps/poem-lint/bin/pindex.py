#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys, commands, yaml


if __name__ == '__main__':
    if len(sys.argv) == 1:
        show = 4
    else:
        show = sys.argv[1]

    with open('./config.yaml', 'r') as f:
        paths =  ['%s.md' % chapter for chapter in yaml.safe_load(f)['chapters']]

    for path in paths:
        title = commands.getoutput('head -n 2 %s | tail -n 1' % path)[8:-1]
        print '\n%s\n%s\n%s\n' % ('-' * len(title), title, '-' * len(title))
        lines = filter(str.strip, commands.getoutput("grep '^#' %s" % path).split('\n'))
        for line in lines:
            if '#### ' in line:
                if 4 <= show:
                    print '      ' + line[5:]
            elif '### ' in line:
                if 3 <= show:
                    print '    ' + line[4:]
            elif '## ' in line:
                if 2 <= show:
                    print '  ' + line[3:]
            elif '# ' in line:
                print '' + line[2:]

