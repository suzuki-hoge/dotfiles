function! N_Open(command, isDir)
	let entry = GetOneByCursor()
	if entry.isDir == a:isDir
		call s:open(entry, a:command)
	endif
endfunction

function! s:open(entry, command)
	execute 'silent !' . a:command . ' ' . a:entry.path
endfunction
