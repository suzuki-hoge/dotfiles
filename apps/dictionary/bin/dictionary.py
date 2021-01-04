#!/usr/bin/python
# -*- coding: utf-8 -*-

import re, sys, commands, codecs
from DictionaryServices import DCSCopyTextDefinition


sys.stdout = codecs.getwriter('utf8')(sys.stdout)


def look_up(word):
    return DCSCopyTextDefinition(None, word, (0, len(word)))


def format_for_j_to_e(line):
    line = re.sub(u'([ぁ-んァ-ン一-龥])\s*([a-zA-Z])', r'\1\n\2', line)
    line = re.sub(u'([a-zA-Z.\)!?])\s*([ぁ-んァ-ン一-龥▸])', r'\1\n\n\2', line)
    line = re.sub(u'(名詞|動詞|形容詞|副詞)', r'\1\n', line)

    return '\n' + line


def format_for_e_to_j(line):
    line = re.sub(u'([0-9] )', r'\n\n\1', line)
    line = re.sub(u'(名詞|動詞|形容詞|他動詞|接頭辞|副詞)', r'\n\n\1\n ', line)
    line = re.sub(u'(▸)', r'\n\1 ', line)

    return '\n' + line


def suggest_and_re_process(word):
    suggests = filter(lambda s: s != '', commands.getoutput('sp %s' % word).split(', '))

    if suggests:
        print ''

        for i, suggest in enumerate(suggests, 1):
            print '%d: %s' % (i, suggest)

        print '\n0: abort\n'

        n = input('enter: ') - 1

        if n != -1:
            process(suggests[n])

    else:
        print '\nno suggests.'


def process(word):
    result = look_up(word)

    if re.match('[a-zA-Z]', word) is None:
        if result is None:
            print '\nno results.'

        else:
            print format_for_j_to_e(result)

    else:
        if result is None:
            suggest_and_re_process(word)

        else:
            print format_for_e_to_j(result)


if __name__ == '__main__':
    word = sys.argv[1].decode('utf-8')

    try:
        process(word)

    except KeyboardInterrupt:
        sys.exit(0)

