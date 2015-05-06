" vim:set ft=vim:

if has('kaoriya')
	let g:tagbar_ctags_bin = '/Applications/MacVim.app/Contents/MacOS/ctags'
endif

nnoremap ƒ~ :TagbarToggle<CR>
nnoremap ƒƒ :TagbarClose<CR>
