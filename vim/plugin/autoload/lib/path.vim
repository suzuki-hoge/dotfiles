function! lib#path#fullpath(path)
	let full = fnamemodify(a:path, ':p')
	if full =~# '\/$'
		let full = full[:-2]
	endif

	return full
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
