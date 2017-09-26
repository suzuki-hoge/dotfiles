import os
import os.path
import json


home = os.path.expanduser('~')
global_note_directory_path = '%(home)s/Dropbox/.filterable-note' % locals()
local_note_directory_path = '%(home)s/.filterable-note' % locals()


def global_notes():
    return __notes(global_note_directory_path)


def local_notes():
    return '\n'.join(__notes(local_note_directory_path))


def __notes(directory):
    return map(lambda x: x.replace('.json', ''), os.listdir(directory))


def local_note_lines(note_name):
    return __read_one(local_note_directory_path, note_name)

def __to_paths(directory):
    return map(lambda x: directory + x, os.listdir(directory))


def __read_one(directory, note_name):
    with file('%(directory)s/%(note_name)s.json' % locals(), 'r') as f:
        return json.load(f)
