let s:api = $pete . '/api/main '

let g:execute_mode = 0
let g:make_mode = 0
let g:test_mode = 0
let g:debug_mode = 0

function! pete#main#help()
	let extension = s:getExtension()
	let command = 'help '
	let mode = s:getMode()
	let text = 'tenshi'
	let r = system(s:api . extension . command . mode . text)
	echo r
endfunction

function! s:getExtension()
	return expand('%:e') . ' '
endfunction

function! s:getMode()
	return g:execute_mode . g:make_mode . g:test_mode . g:debug_mode . ' '
endfunction
