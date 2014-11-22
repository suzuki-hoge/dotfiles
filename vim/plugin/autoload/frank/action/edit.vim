function! frank#action#edit#normal()
	let paths = frank#finder#bypos()
	call s:edit(paths)
endfunction

function! s:edit(paths)
	for path in split(a:paths, '\n')
		if !isdirectory(path)
			execute 'tabedit ' . path
		endif
	endfor
endfunction
