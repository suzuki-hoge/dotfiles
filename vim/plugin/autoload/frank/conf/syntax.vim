if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax match head "^-*$"
syntax match head "^=*$"
syntax match head "^\/.*$"

syntax match dir "^[^\/].*\/"

syntax match mark "{"
syntax match mark "}"

hi def link head Comment
hi def link dir  Comment
hi def link mark Ignore

hi Folded guifg=blue

let b:current_syntax = "frank"

let &cpo = s:cpo_save
unlet s:cpo_save
