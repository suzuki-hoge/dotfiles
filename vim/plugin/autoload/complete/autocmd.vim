augroup complete
	autocmd!
	autocmd BufEnter * :set completefunc=complete#main#main
augroup END
