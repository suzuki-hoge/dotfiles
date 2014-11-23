function! lib#path#fullpath(path)
	return fnamemodify(a:path, ':p')
endfunction

function! lib#path#extension(path)
	return fnamemodify(a:path, ':e')
endfunction
