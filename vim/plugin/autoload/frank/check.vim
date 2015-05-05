function! frank#check#too_shallow(path)
	let depth = lib#path#depth(a:path)

	if depth < 3
		throw 'TooShallowDepth'
	endif
endfunction
