if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax match done  "^\s*+ .*$"
syntax match doing "^\s*# .*$"
syntax match yet   "^\s*- .*"

hi def link done  Type
hi def link doing PreProc
hi def link yet   Statement

let b:current_syntax = "todo"

let &cpo = s:cpo_save
unlet s:cpo_save
