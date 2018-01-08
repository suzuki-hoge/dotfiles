import os
import os.path
import json


home = os.path.expanduser('~')
global_book_path = '%(home)s/Dropbox/Developments/dotfiles/apps/filterable-book/def' % locals() # todo
local_book_path = '%(home)s/.filterable-book' % locals()

book_paths = {'global': global_book_path, 'local': local_book_path}


def books(book):
    book_path = book_paths[book]
    return '\n'.join([note_name.replace('.json', '') for note_name in os.listdir(book_path)])


def lines(book, note):
    book_path = book_paths[book]
    return __read_one(book_path, note)


def __read_one(book_path, note):
    with file('%(book_path)s/%(note)s.json' % locals(), 'r') as f:
        return json.load(f, 'utf-8')
