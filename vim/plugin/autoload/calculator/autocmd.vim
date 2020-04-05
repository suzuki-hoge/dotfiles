augroup calculator
	autocmd!
	autocmd BufEnter                 work.calculator :so $dot/vim/plugin/autoload/calculator/configure.vim
	autocmd TextChanged,TextChangedI exp             :call calculator#process#calc_all()
augroup END

