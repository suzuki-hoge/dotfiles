function! frank#dirstack#new()
	let s:directoryStacks = []
endfunction	

function! frank#dirstack#push()
	let s:directoryStacks = s:directoryStacks + [g:project_root_path]
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
