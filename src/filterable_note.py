from pure import converter, formatter
from system import filer

print filer.local_notes()

json = filer.local_note_lines('url')
masked_json = converter.mask(json)

print converter.to_value('1 | foo label | foo tag 1, foo tag 2 | ***', json)

print formatter.vertical_align(masked_json)
