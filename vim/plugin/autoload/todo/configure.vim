augroup todo
	autocmd!
	autocmd BufEnter  *.todo source $autoload/todo/syntax.vim
	autocmd FileType todo source $autoload/todo/syntax.vim
augroup END
