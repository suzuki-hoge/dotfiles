function! frank#window#checker#isFrank()
	return bufname(0)[:-2] == 'frank-'
endfunction
