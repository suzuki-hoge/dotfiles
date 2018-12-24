import sys
import codecs

from pure import converter, formatter
from system import filer

sys.stdout = codecs.getwriter('utf8')(sys.stdout)


def books(book):
    print filer.books(book)


def lines(book, note):
    json = filer.lines(book, note)
    masked_json = converter.for_stdout(json)
    print formatter.vertical_align(masked_json)


def line_value(book, note, line_id):
    json = filer.lines(book, note)
    print converter.to_value(line_id, json)


args = sys.argv

# filterable_book_py local
if len(args) == 2:
    books(args[1])

# filterable_book_py local url
elif len(args) == 3:
    lines(args[1], args[2])

# filterable_book_py local url key
else:
    line_value(args[1], args[2], args[3])