if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax match dir "^[^/].*\/"
syntax match mark "}"

hi def link dir  Comment
"hi def link mark Ignore
hi Folded guifg=blue

let b:current_syntax = "frank"

let &cpo = s:cpo_save
unlet s:cpo_save
