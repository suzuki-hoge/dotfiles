from pure import converter
from system import filer

print filer.local_notes()

json = filer.local_note_lines('url')
print converter.to_lines(json)

print converter.to_value('2, agent 2, lte / agent, https://foo.net/bar...', json)
