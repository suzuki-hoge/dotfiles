function! N_DirUp()
	let upper = fnamemodify(DSLast(), ':h')
	let depth = len(substitute(upper, '[^/]', '', 'g'))
	if depth < 3
		echo 'too many files...'
	else
		call s:cd(upper)
		call DSPush(upper)
	endif
endfunction

function! N_DirDown()
	let entry = GetOneByCursor()
	if entry.isDir
		call s:cd(entry.path)
		call DSPush(entry.path)
	endif
endfunction

function! N_DirPrev()
	let prev = DSPop()
	call s:cd(prev)
endfunction

function! s:cd(path)
	call Remake(a:path)
endfunction
