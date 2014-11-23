function! frank#window#checker#isFrank()
	return bufname('%')[:-2] == 'frank-'
endfunction
