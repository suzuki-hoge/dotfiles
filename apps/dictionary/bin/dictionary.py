#!/usr/bin/python

import os
import sys
import argparse
from DictionaryServices import DCSCopyTextDefinition


if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog = 'Dictionary', description = 'look up dict.app')
    parser.add_argument('word', metavar = 'word', type = str, help = 'search word')
    parser.add_argument('-e', '--exists', default = False, action = 'store_true', help = 'put search word to clipboard if exists')
    args = parser.parse_args()

    word = args.word.decode('utf-8')
    result = DCSCopyTextDefinition(None, word, (0, len(word)))


    if result is None:
        sys.exit('Not Exist')

    if args.exists:
        print 'copied'
        os.system("echo %s | tr -d '\n' | pbcopy" % word)
    else:
        print result
