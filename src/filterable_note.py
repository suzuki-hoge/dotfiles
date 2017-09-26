import sys

from pure import converter, formatter
from system import filer


def notes(book_name):
    print filer.notes(book_name)


def read(book_name, note_name):
    json = filer.read(args[1], args[2])
    masked_json = converter.mask(json)
    print formatter.vertical_align(masked_json)


def value(book_name, note_name, key):
    json = filer.read(args[1], args[2])
    print converter.to_value(key, json)


args = sys.argv

# python filterable_note.py local
if len(args) == 2:
    notes(args[1])

# python filterable_note.py local url
elif len(args) == 3:
    read(args[1], args[2])

# python filterable_note.py local url 1
else:
    value(args[1], args[2], args[3])
