function! N_PointChange(value)
	let entry = GetOneByCursor()
	call s:pointChange([entry], a:value)
endfunction

function! V_PointChange(value) range
	let entries = GetByRange(a:firstline, a:lastline)
	call s:pointChange(entries, a:value)
endfunction

function! s:pointChange(entries, value)
	for entry in a:entries
		let entry.point = a:value
		call Update(entry)
	endfor
endfunction