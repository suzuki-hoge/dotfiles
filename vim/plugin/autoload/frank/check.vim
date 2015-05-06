function! frank#check#too_shallow(path)
	let depth = lib#path#depth(a:path)

	if depth < 3
		throw 'TooShallowDepth'
	endif
endfunction


function! frank#check#exist_directory(path)
	if !isdirectory(a:path)
		throw 'NotExistPath'
	endif
endfunction


function! frank#check#frank_exists()
	if s:exists('Frank')
		throw 'FrankExists'
	endif
endfunction


function! frank#check#launcher_exists()
	if s:exists('Launcher')
		throw 'LauncherExists'
	endif
endfunction


function! s:exists(name)
	return bufnr(a:name) != -1
endfunction
