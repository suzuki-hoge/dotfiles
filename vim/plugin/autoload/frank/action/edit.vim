function! frank#action#edit#normal()
	let entries = frank#action#base#getByPoint()
	if entries != []
		call s:edit(entries)
	endif

	let entry = frank#action#base#getByCursor()
	call s:edit([entry])
endfunction

function! frank#action#edit#visual() range
	let entries = frank#action#base#getByRange(a:firstline, a:lastline)
	call s:edit(entries)
endfunction

function! s:edit(entries)
	for entry in a:entries
		if !entry.isDir
			execute 'tabedit ' . entry.path
		endif
	endfor
endfunction
