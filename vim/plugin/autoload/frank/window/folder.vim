function! frank#window#folder#setopt()
	setlocal foldmarker=/,}
	setlocal foldmethod=marker
	setlocal fillchars=vert:\|
	setlocal foldtext=frank#window#folder#text()
endfunction

function! frank#window#folder#text()
	return getline(v:foldstart)
endfunction
