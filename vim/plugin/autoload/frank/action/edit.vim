function! frank#action#edit#normal(isStay)
	let path = frank#finder#oneByPos()
	call s:edit(path, a:isStay)
endfunction

function! frank#action#edit#visual(isStay) range
	let paths = frank#finder#oneByRange(a:firstline, a:lastline)
	call s:edits(paths, a:isStay)
endfunction

" todo tabnum
function! s:edit(path, isStay)
	if !isdirectory(a:path)
		execute 'tabedit ' . a:path
	endif

	if a:isStay
		execute ':normal gT'
	endif
endfunction

function! s:edits(paths, isStay)
	for path in a:paths
		if !isdirectory(path)
			execute 'tabedit ' . path
		endif
	endfor

	if a:isStay
		let n = len(a:paths)
		execute ':normal ' . n . 'gT'
	endif
endfunction
