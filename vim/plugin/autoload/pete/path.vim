function! pete#path#execute(...)
	let g:execute_path = s:getPath(a:000)

	echo 'current execute path : ' . g:execute_path
endfunction


function! pete#path#make(...)
	let g:make_path = s:getPath(a:000)

	echo 'current make path : ' . g:make_path
endfunction


function! pete#path#test(...)
	let g:test_path = s:getPath(a:000)

	echo 'current test path : ' . g:test_path
endfunction


function! s:getPath(arg)
	if a:arg == []
		return '%'
	elseif a:arg[0] == '%'
		return fnamemodify(expand('%'), ':p')
	else
		if filereadable(a:arg[0])
			return fnamemodify(a:arg[0], ':p')
		else
			return fnamemodify(expand('%'), ':p')
		endif
	endif
endfunction
