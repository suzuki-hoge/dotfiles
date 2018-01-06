#!/usr/bin/env python

import defines

def asDict(define):
    return "    <dict><key>shortcut</key><string>%s</string><key>phrase</key><string>%s</string></dict>" % (define[0], define[1])

with open("dict.plist", "w") as file:
    file.write("""\
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <array>
%s
  </array>
</plist>
""" % '\n'.join(map(asDict, defines.office + defines.short_cut + defines.japanese)))
