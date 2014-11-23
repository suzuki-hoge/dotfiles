function! frank#dirstack#new()
	let s:directoryStacks = []
endfunction	

function! frank#dirstack#push(path)
	let s:directoryStacks = s:directoryStacks + [a:path]
endfunction	

function! frank#dirstack#pop()
	if len(s:directoryStacks) != 1
		call remove(s:directoryStacks, -1)
	endif
	return frank#dirstack#last()
endfunction	

function! frank#dirstack#last()
	return s:directoryStacks[-1]
endfunction	
