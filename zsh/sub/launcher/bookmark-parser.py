# -*- coding: utf-8 -*-

import sys, commands


def keys():
    bookmarks = '~/.bookmark-launcher.json'

    for name in commands.getoutput("""jq -r '.roots.bookmark_bar.children[] | select(.name == "bl") | .children[] | .children[] | .name' %(bookmarks)s""" % locals()).split('\n'):
        print name


def val(key):
    bookmarks = '~/.bookmark-launcher.json'

    print commands.getoutput("""jq -r '.roots.bookmark_bar.children[] | select(.name == "bl") | .children[] | .children[] | select(.name == "%(key)s") | .url' %(bookmarks)s""" % locals()).strip()


if len(sys.argv) == 1:
    print 'keys | val {key}'

elif sys.argv[1] == 'keys':
    keys()

elif sys.argv[1] == 'val':
    val(sys.argv[2])

