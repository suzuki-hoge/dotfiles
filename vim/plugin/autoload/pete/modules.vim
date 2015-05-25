let s:api = $pete . '/api/dist/build/pete/pete '


function! pete#modules#callapi(command, text)
	let result = system(s:getShLine(a:command, a:text))
	if result == 'invalid'
		echo s:getShLine(a:command, a:text)
		throw "Invalid"
	else
		return result
	endif
endfunction


function! s:getShLine(command, text)
	return s:api . a:command . ' ' . s:getMode() . '"' . a:text . '"' . s:getExtension()
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
	let s = substitute(a:text, "\\$", "\\\\$", "g")
	return substitute(s, '"', '\\"', "g")
endfunction


function! pete#modules#editPete()
	let files = ['Repl', 'Edit', 'Options', 'Comment', 'Executors', 'Makers', 'Testers', 'Debuggers', 'Help']
	for file in files
		execute 'tabedit $pete/api/src/' . file . '.hs'
	endfor
endfunction
