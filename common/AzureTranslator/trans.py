#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import argparse

from Dispatch import Dispatch
from Translator import Translator

parser = argparse.ArgumentParser(description = 'translate text with microsoft azure translator api')
parser.add_argument('text', action = 'store', help = 'text')
args = parser.parse_args()

if Dispatch.isEn(args.text):
	translator = Translator('en', 'ja', args.text)
else:
	translator = Translator('ja', 'en', args.text)

print args.text
print translator.execute()
