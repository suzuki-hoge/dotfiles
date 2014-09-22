function! DSNew()
	let s:directoryStacks = []
endfunction	

function! DSPush(path)
	let s:directoryStacks = s:directoryStacks + [a:path]
endfunction	

function! DSPop()
	if len(s:directoryStacks) != 1
		call remove(s:directoryStacks, -1)
	endif
	return DSLast()
endfunction	

function! DSLast()
	return s:directoryStacks[-1]
endfunction	
