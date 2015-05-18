let s:api = $pete . '/api/main '

let g:execute_mode = 0
let g:make_mode = 0
let g:test_mode = 0
let g:debug_mode = 0

function! pete#main#help()
	echo s:callApi('help ', 'pete')
endfunction

function! pete#main#execute(...)
	let command = s:callApi('execute ', '')
	execute command . '%' . s:getArgs(a:000)
endfunction

function! pete#main#test(...)
	let command = s:callApi('test ', '')
	execute command . '%' . s:getArgs(a:000)
endfunction

function! pete#main#edit()
	execute s:callApi('edit ', 'a')
endfunction

function! pete#main#repl()
	execute s:callApi('repl ', '')
endfunction

function! pete#main#make(...)
	let command = s:callApi('make ', '')
	execute command . '%' . s:getArgs(a:000)
endfunction

function! pete#main#options()
	execute s:callApi('options ', '')
endfunction

function! pete#main#debug(...)
	let lines = s:callApi('debug ', get(a:, 1, expand('<cword>')))
	execute 'normal o'
	execute 'normal o' . lines
	execute 'normal o'
endfunction

function! pete#main#commentize() range
	for n in range(a:firstline, a:lastline)
		" todo
		call setline(n, s:callApi('commentize ', getline(n)))
	endfor
endfunction

function! pete#main#decommentize() range
	for n in range(a:firstline, a:lastline)
		call setline(n, s:callApi('decommentize ', getline(n)))
	endfor
endfunction

function! pete#main#switch() range
	for n in range(a:firstline, a:lastline)
		call setline(n, s:callApi('switch ', getline(n)))
	endfor
endfunction

function! s:getExtension()
	return expand('%:e') . ' '
endfunction

function! s:getMode()
	return g:execute_mode . g:make_mode . g:test_mode . g:debug_mode . ' '
endfunction

function! s:callApi(command, text)
	return system(s:api . s:getExtension() . a:command . s:getMode() . a:text)
endfunction

function! s:getArgs(args)
	let s = ''
	for e in a:args
		let s .= ' ' . e
	endfor
	return s
endfunction
