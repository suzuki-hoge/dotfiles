function! FindWordHeadPos()
	let currentLine = strpart(getline('.'), 0, col('.') - 1)
	return match(currentLine, '[a-zA-Z0-9*$_]*$')
endfunction
