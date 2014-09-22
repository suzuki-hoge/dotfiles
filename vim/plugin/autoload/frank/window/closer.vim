function! frank#window#closer#all()
	call s:close(1)
	call s:close(2)
	call s:close(3)
endfunction

function! s:close(n)
	let bufnum = bufnr('frank-' . a:n)
	if bufnum != -1
		execute 'bdelete ' . bufnum
	endif
endfunction
