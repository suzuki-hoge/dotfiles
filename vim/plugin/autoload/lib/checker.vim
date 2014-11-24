function! lib#checker#isBlank()
	return bufname('%') == ''
endfunction

function! lib#checker#isHome()
	return system('envcheck --home')
endfunction

function! lib#checker#isWork()
	return system('envcheck --work')
endfunction
