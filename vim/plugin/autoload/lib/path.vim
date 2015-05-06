function! lib#path#fullpath(path)
	if !isdirectory(a:path)
		throw 'NoSuchDirectory'
	endif

	execute 'cd ' . a:path
	let full = fnamemodify(getcwd(), ':p')
	execute 'cd -'

	if full == '/'
		return full
	else
		return full[:-2]
	endif
endfunction

function! lib#path#extension(path)
	return fnamemodify(a:path, ':e')
endfunction

function! lib#path#head(path)
	return fnamemodify(a:path, ':h')
endfunction

function! lib#path#depth(path)
	let full = lib#path#fullpath(a:path)
	return len(substitute(full, '[^/]', '', 'g'))
endfunction
