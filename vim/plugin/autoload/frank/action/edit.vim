function! frank#action#edit#normal()
	let path = frank#finder#oneByPos()
	call s:edit(path)
endfunction

function! s:edit(path)
	if !isdirectory(a:path)
		execute 'tabedit ' . a:path
	endif
endfunction
