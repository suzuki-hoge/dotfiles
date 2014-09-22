function! frank#action#read#exec()
	let entry = frank#action#base#getByCursor()
	call s:read(entry)
endfunction

function! s:read(entry)
	if !a:entry.isDir
		call frank#window#printer#to2(a:entry.path)
		call frank#window#switcher#to(1)
	endif
endfunction
