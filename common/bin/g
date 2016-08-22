#!/usr/bin/python

import os
import argparse

parser = argparse.ArgumentParser(description = 'open chrome and search with google')
parser.add_argument('queries', metavar = 'queries', type = str, nargs = '*', help = "search queries (default : '')")

page_group = parser.add_mutually_exclusive_group()
page_group.add_argument('-f', '--facebook', default = False, action = 'store_true', help = 'open facebook')
page_group.add_argument('-n', '--niconico', default = False, action = 'store_true', help = 'open niconico')
page_group.add_argument('-2', '--matome',   default = False, action = 'store_true', help = 'open 2ch')
page_group.add_argument('-c', '--chatwork', default = False, action = 'store_true', help = 'open chatwork')
page_group.add_argument('-e', '--en_trans', default = False, action = 'store_true', help = 'open google translate(en -> ja)')
page_group.add_argument('-j', '--ja_trans', default = False, action = 'store_true', help = 'open google translate(ja -> en)')

args = parser.parse_args()

if args.facebook:
	os.system('open -a Google\ Chrome https://www.facebook.com/')

elif args.niconico:
	os.system('open -a Google\ Chrome http://www.nicovideo.jp/')

elif args.matome:
	os.system('open -a Google\ Chrome http://labo.tv/2chnews/')

elif args.chatwork:
	os.system('open -a Google\ Chrome https://www.chatwork.com/#!rid18210402')

elif args.en_trans:
	os.system('open -a Google\ Chrome https://translate.google.co.jp/#en/ja/')

elif args.ja_trans:
	os.system('open -a Google\ Chrome https://translate.google.co.jp/#ja/en/')

else:
	q = '+'.join(args.queries)
	os.system('open -a Google\ Chrome http://www.google.co.jp/search?q=%s' % q)
