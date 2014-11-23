function! frank#action#edit#normal(isStay)
	let path = frank#finder#oneByPos()

	let pos = s:getpos()
	call s:edit(path, a:isStay)
	call s:setpos(pos, a:isStay)
endfunction

function! frank#action#edit#visual(isStay) range
	let paths = frank#finder#oneByRange(a:firstline, a:lastline)

	let pos = s:getpos()
	call s:edits(paths, a:isStay)
	call s:setpos(pos, a:isStay)
endfunction

function! s:edit(path, isStay)
	if !isdirectory(a:path)
		execute '$tabedit ' . a:path
	endif
endfunction

function! s:edits(paths, isStay)
	for path in a:paths
		if !isdirectory(path)
			execute '$tabedit ' . path
		endif
	endfor
endfunction

function! s:getpos()
	return tabpagenr()
endfunction

function! s:setpos(pos, isStay)
	if a:isStay
		let pos = tabpagenr()
		let distance = pos - a:pos
		execute ':normal ' . distance . 'gT'
	endif
endfunction
