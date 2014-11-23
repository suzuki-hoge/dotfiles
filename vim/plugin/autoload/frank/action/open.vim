function! frank#action#open#open()
	let path = frank#finder#oneByPos()
	call s:open(path)
endfunction

function! s:open(path)
	if isdirectory(a:path)
		execute 'silent !open ' . a:path
	endif
endfunction

function! frank#action#open#app()
	let path = frank#finder#oneByPos()
	call s:app(path)
endfunction

function! s:app(path)
	if !isdirectory(a:path)
		execute 'silent !open ' . a:path
	endif
endfunction

function! frank#action#open#qlmanage()
	let path = frank#finder#oneByPos()
	call s:qlmanage(path)
endfunction

function! s:qlmanage(path)
	if !isdirectory(a:path)
		execute 'silent !qlmanage -p ' . a:path
	endif
endfunction
