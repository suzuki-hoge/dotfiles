function! frank#action#open#exec(command, isDir)
	let entry = frank#action#base#getByCursor()
	if entry.isDir == a:isDir
		call s:open(entry, a:command)
	endif
endfunction

function! s:open(entry, command)
	execute 'silent !' . a:command . ' ' . a:entry.path
endfunction
