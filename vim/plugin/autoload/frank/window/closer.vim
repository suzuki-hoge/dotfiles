function! frank#window#closer#all()
	if frank#window#checker#isFrank()
		call s:close(1)
		call s:close(2)
		call s:close(3)
	else
		execute 'bdelete'
	endif
endfunction

function! s:close(n)
	let bufnum = bufnr('frank-' . a:n)
	if bufnum != -1
		execute 'bdelete ' . bufnum
	endif
endfunction
