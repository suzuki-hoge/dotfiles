let s:api = $pete . '/api/main '


function! pete#modules#callapi(command, text)
	let result = system(s:api . a:command . s:getMode() . '"' . a:text . '"' . s:getExtension())
	if result == 'invalid'
		echo s:api . a:command . s:getMode() . '"' . a:text . '"' . s:getExtension()
		throw "Invalid"
	else
		return result
	endif
endfunction


function! s:getExtension()
	return ' ' . expand('%:e')
endfunction


function! s:getMode()
	return g:execute_mode . g:make_mode . g:test_mode . g:debug_mode . ' '
endfunction


function! pete#modules#getargs(args)
	let s = ''
	for e in a:args
		let s .= ' ' . e
	endfor
	return s
endfunction


function! pete#modules#escape(text)
	return substitute(a:text, "\\$", "\\\\$", "g")
endfunction
