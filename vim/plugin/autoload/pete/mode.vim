function! pete#mode#execute(...)
	if a:0 == 1
		let g:execute_mode = a:1
	endif

	execute 'H'
endfunction


function! pete#mode#make(...)
	if a:0 == 1
		let g:make_mode = a:1
	endif

	execute 'H'
endfunction


function! pete#mode#test(...)
	if a:0 == 1
		let g:test_mode = a:1
	endif

	execute 'H'
endfunction


function! pete#mode#debug(...)
	if a:0 == 1
		let g:debug_mode = a:1
	endif

	execute 'H'
endfunction
