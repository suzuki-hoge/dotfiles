function! N_Edit()
	let entries = GetByPoint()
	if entries != []
		call s:edit(entries)
	endif

	let entry = GetOneByCursor()
	call s:edit([entry])
endfunction

function! V_Edit() range
	let entries = GetByRange(a:firstline, a:lastline)
	call s:edit(entries)
endfunction

function! s:edit(entries)
	for entry in a:entries
		if !entry.isDir
			execute 'tabedit ' . entry.path
		endif
	endfor
endfunction