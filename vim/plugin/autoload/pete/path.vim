function! pete#path#execute(...)
	let g:execute_path = s:getPath(a:000)

	echo 'current execute path : ' . g:execute_path
endfunction


function! pete#path#make(...)
	let g:make_path = s:getPath(a:000)

	echo 'current make path : ' . g:make_path
endfunction


function! pete#path#tool(...)
	let g:tool_path = s:getPath(a:000)

	echo 'current tool path : ' . g:tool_path
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
			return a:arg[0]
		endif
	endif
endfunction
