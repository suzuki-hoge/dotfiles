function! pete#path#execute(...)
	let g:execute_path = s:getPath(a:000)

	execute 'WH'
endfunction


function! pete#path#tool(...)
	let g:tool_path = s:getPath(a:000)

	execute 'TH'
endfunction


function! s:getPath(arg)
	if a:arg == []
		return ''
	elseif a:arg[0] == '%'
		return '%'
	else
		if filereadable(a:arg[0])
			return fnamemodify(a:arg[0], ':p')
		else
			return a:arg[0]
		endif
	endif
endfunction
