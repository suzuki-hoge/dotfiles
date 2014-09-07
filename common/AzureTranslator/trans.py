#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import argparse

from Dispatch import Dispatch
from Translator import Translator

parser = argparse.ArgumentParser(description = 'translate text with microsoft azure translator api')
parser.add_argument('text', metavar = 'text', type = str, nargs = '*', help = 'text you want to translate')
args = parser.parse_args()

text = ' '.join(args.text)

if Dispatch.isEn(text):
	translator = Translator('en', 'ja', text)
else:
	translator = Translator('ja', 'en', text)

print text
print translator.execute()
