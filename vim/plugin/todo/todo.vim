" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

"タブで始まり最後に半角スペースが入るもの
syntax match feDir "\t*.\+\s$"

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link feDir Comment

let b:current_syntax = "todo"

let &cpo = s:cpo_save
unlet s:cpo_save
