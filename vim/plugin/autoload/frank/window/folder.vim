function! frank#window#folder#setopt()
	setlocal foldmarker={,}
	setlocal foldmethod=marker
	setlocal fillchars=vert:\|
	setlocal foldtext=frank#window#folder#text()
endfunction

function! frank#window#folder#text()
	let line = getline(v:foldstart)
	return getline(v:foldstart)[:-2]
endfunction
