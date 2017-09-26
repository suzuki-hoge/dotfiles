from pure import converter, formatter
from system import filer

print filer.notes('local')

json = filer.read('local', 'url')
masked_json = converter.mask(json)

print converter.to_value('1', json)

print formatter.vertical_align(masked_json)


"""
fng

    path
  > url
    password
"""

"""
fng url

    1 | foo | ...
  > 2 | foo | ...
    3 | foo | ...
"""

"""
fnl

    path
  > url
    password
"""

"""
fnl url

    1 | foo | ...
  > 2 | foo | ...
    3 | foo | ...
"""

"""
python filterable_note.py global

python filterable_note.py global url

python filterable_note.py global url 1
"""
