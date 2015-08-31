augroup todo
	autocmd!
	autocmd BufEnter  *.todo source $plugin/autoload/todo/syntax.vim
	autocmd FileType todo source $plugin/autoload/todo/syntax.vim
augroup END
