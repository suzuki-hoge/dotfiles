#!/usr/bin/python
# -*- coding: utf-8 -*-

import re, sys
from DictionaryServices import DCSCopyTextDefinition


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


def process(word):
    result = look_up(word)

    if re.match('[a-zA-Z]', word) is None:
        print format_for_j_to_e(result)

    else:
        print format_for_e_to_j(result)


if __name__ == '__main__':
    word = sys.argv[1].decode('utf-8')

    process(word)

