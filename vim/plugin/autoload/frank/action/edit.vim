function! frank#action#edit#normal()
	let path = frank#finder#oneByPos()
	call s:edit(path)
endfunction

function! frank#action#edit#visual() range
	let paths = frank#finder#oneByRange(a:firstline, a:lastline)
	for path in paths
		call s:edit(path)
	endfor
endfunction

function! s:edit(path)
	if !isdirectory(a:path)
		execute 'tabedit ' . a:path
	endif
endfunction
