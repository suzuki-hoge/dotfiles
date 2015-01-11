function! FindWords2()
	return s:toWord(s:currentBufferLines() + s:otherBufferLines())
endfunction

function! s:toWord(lines)
	let result = []

	for line in a:lines
		let result += split(line, '[^a-zA-Z0-9_]')
	endfor

	return result
endfunction

function! s:currentBufferLines()
	let current = line('.')
	let headToCurrent = getbufline(bufnr('%'), 1, current)
	let currentToTail = getbufline(bufnr('%'), current + 1, '$')
	return reverse(headToCurrent) + reverse(currentToTail)
endfunction

function! s:otherBufferLines()
	let n = 1
	let last = bufnr('$')
	let lines = []

	while n <= last
		if buflisted(n) && n != bufnr('%')
			let lines += s:getLines(n)
		endif
		let n = n + 1
	endwhile

	return lines
endfunction

function! s:getLines(bufnum)
	return getbufline(a:bufnum, 1, '$')
endfunction
