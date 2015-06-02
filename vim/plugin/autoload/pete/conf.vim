function! pete#conf#read()
	if pete#conf#isExist()
		let $path = pete#conf#path()
		source $path
	endif
endfunction


function! pete#conf#isExist()
	return filereadable(pete#conf#path())
endfunction


function! pete#conf#path()
	return getcwd() . '/.pete.vim'
endfunction


function! pete#conf#default()
	let g:execute_mode = 0
	let g:tool_mode    = 0
	let g:debug_mode   = 0

	let g:execute_path = '%'
	let g:tool_path    = '%'
endfunction
