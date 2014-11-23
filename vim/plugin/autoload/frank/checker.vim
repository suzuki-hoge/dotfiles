function! frank#checker#isFrank()
	return bufname('%')[:-2] == 'frank-'
endfunction

function! frank#checker#checkAlreadyFrank()
	if frank#checker#isFrank()
		throw 'AlreadyFrank'
	endif
endfunction

function! frank#checker#checkTooShallowDepth(path)
	let depth = len(substitute(a:path, '[^/]', '', 'g'))

	if depth < 3
		throw 'TooShallowDepth'
	endif
endfunction

function! frank#checker#checkNotExistPath(path)
	if !isdirectory(a:path)
		throw 'NotExistPath'
	endif
endfunction

function! frank#checker#isLauncher()
	return bufname('%') == 'launcher'
endfunction

function! frank#checker#checkAlreadyLauncher()
	if frank#checker#isLauncher()
		throw 'AlreadyLauncher'
	endif
endfunction

function! frank#checker#isSingleFrank()
	return frank#checker#isFrank() && !frank#checker#isFullMode()
endfunction!

function! frank#checker#isFullMode()
	return g:full_mode
endfunction

function! frank#checker#isRootMode()
	return g:root_mode
endfunction
