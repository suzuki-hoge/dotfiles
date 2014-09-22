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

"function! ReadFile(path)
"	execute 'r ' . a:path
"	execute '0delete _'
"	let extension = fnamemodify(a:path, ':e')
"	" tmp
"	if extension == '' | let extension = 'vim' | endif
"	let &filetype = extension
"endfunction

