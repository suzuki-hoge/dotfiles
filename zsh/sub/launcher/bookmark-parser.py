# -*- coding: utf-8 -*-

import sys, commands


def keys():
    bookmarks = '~/.bookmark-launcher.json'

    dirs = commands.getoutput("""yq -r '.roots.bookmark_bar.children[] | select(.name == "bl") | .children[] | select(.type == "folder") | .name' %(bookmarks)s""" % locals()).split('\n')

    for dir in dirs:
        keys = commands.getoutput("""yq -r '.roots.bookmark_bar.children[] | select(.name == "bl") | .children[] | select(.name == "%(dir)s") | .children[].name' %(bookmarks)s""" % locals()).split('\n')
        for key in keys:
            print '%(dir)s / %(key)s' % locals()


def val(key):
    bookmarks = '~/.bookmark-launcher.json'

    dir = key.split('/')[0].strip()
    name = key.split('/')[1].strip()

    val = commands.getoutput("""yq -r '.roots.bookmark_bar.children[] | select(.name == "bl") | .children[] | select(.name == "%(dir)s") | .children[] | select(.name == "%(name)s") | .url' %(bookmarks)s""" % locals()).strip()

    print val


if len(sys.argv) == 1:
    print 'keys | val {key}'

elif sys.argv[1] == 'keys':
    keys()

elif sys.argv[1] == 'val':
    val(sys.argv[2])

