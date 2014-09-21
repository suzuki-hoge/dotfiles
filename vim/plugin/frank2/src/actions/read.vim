function! N_Read()
	let entry = GetOneByCursor()
	call s:read(entry)
endfunction

function! s:read(entry)
	if !a:entry.isDir
		call WindowSwitch2()
		call ReadFile(a:entry.path)
		call WindowSwitch1()
	endif
endfunction
