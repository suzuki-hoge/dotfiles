import os
import os.path
import json


home = os.path.expanduser('~')
global_note_directory_path = '%(home)s/Dropbox/.filterable-note' % locals()
local_note_directory_path = '%(home)s/.filterable-note' % locals()

directory_paths = {'global': global_note_directory_path, 'local': local_note_directory_path}


def notes(book_name):
    directory_path = directory_paths[book_name]
    return '\n'.join([file_name.replace('.json', '') for file_name in os.listdir(directory_path)])


def read(book_name, note_name):
    directory_path = directory_paths[book_name]
    return __read_one(directory_path, note_name)


def __read_one(directory_path, note_name):
    with file('%(directory_path)s/%(note_name)s.json' % locals(), 'r') as f:
        return json.load(f)
