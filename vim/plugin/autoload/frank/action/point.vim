function! frank#action#point#normal(value)
	let entry = frank#action#base#getByCursor()
	call s:change([entry], a:value)
endfunction

function! frank#action#point#visual(value) range
	let entries = frank#action#base#getByRange(a:firstline, a:lastline)
	call s:change(entries, a:value)
endfunction

function! s:change(entries, value)
	for entry in a:entries
		let entry.point = a:value
		call frank#window#printer#update(entry)
	endfor
endfunction
