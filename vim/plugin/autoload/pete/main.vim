let g:execute_mode = 0
let g:make_mode = 0
let g:test_mode = 0
let g:debug_mode = 0


function! pete#main#commentize() range
	for n in range(a:firstline, a:lastline)
		" todo
		call setline(n, pete#modules#callapi('commentize ', getline(n)))
	endfor
endfunction


function! pete#main#decommentize() range
	for n in range(a:firstline, a:lastline)
		call setline(n, pete#modules#callapi('decommentize ', getline(n)))
	endfor
endfunction


function! pete#main#switch() range
	for n in range(a:firstline, a:lastline)
		call setline(n, pete#modules#callapi('switch ', getline(n)))
	endfor
endfunction


function! pete#main#repl()
	execute pete#modules#callapi('repl ', '')
endfunction


function! pete#main#edit()
	execute pete#modules#callapi('edit ', 'a')
endfunction


function! pete#main#options()
	execute pete#modules#callapi('options ', '')
endfunction


function! pete#main#execute(...)
	let command = pete#modules#callapi('execute ', '')
	execute command . '%' . pete#modules#getargs(a:000)
endfunction


function! pete#main#make(...)
	let command = pete#modules#callapi('make ', '')
	execute command . '%' . pete#modules#getargs(a:000)
endfunction


function! pete#main#test(...)
	let command = pete#modules#callapi('test ', '')
	execute command . '%' . pete#modules#getargs(a:000)
endfunction


function! pete#main#debug(...)
	let lines = pete#modules#callapi('debug ', get(a:, 1, expand('<cword>')))
	execute 'normal o'
	execute 'normal o' . lines
	execute 'normal o'
endfunction


function! pete#main#help()
	echo pete#modules#callapi('help ', 'pete')
endfunction
