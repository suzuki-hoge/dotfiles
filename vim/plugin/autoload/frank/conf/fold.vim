function! frank#conf#fold#setopt()
	setlocal foldmarker={,}
	setlocal foldmethod=marker
	setlocal fillchars=vert:\|
	setlocal foldtext=frank#conf#fold#foldtext()
endfunction

function! frank#conf#fold#foldtext()
	let line = getline(v:foldstart)
	return getline(v:foldstart)[:-2]
endfunction
