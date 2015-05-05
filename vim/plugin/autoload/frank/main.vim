
command! Do so % | call Open()

let s:main = $frank . '/api/main '

function! frank#main#open(path)
	call s:new()

	let indented = s:indented(a:path)
	call lib#buffer#print(indented, 0)

	let g:full = s:full(a:path)
endfunction

function! s:indented(path)
	return system(s:main . a:path . ' indented')
endfunction

function! s:full(path)
	return ['geta'] + split(system(s:main . a:path . ' full'))
endfunction

function! s:new()
	setlocal foldlevelstart=99
	execute '45vnew'
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
	silent file `='frank'`

	call s:keymaps()
endfunction

function! s:keymaps()
	nnoremap <buffer> e :call LeaveEdit()<CR>
	nnoremap <buffer> E :call StayEdit()<CR>
endfunction

function! LeaveEdit()
	let n = line('.')

	execute ':bwipeout'

	execute ':$tabedit ' . g:full[n]
endfunction

function! StayEdit()
	let n = line('.')

	execute ':$tabedit ' . g:full[n]

	execute ':normal gt'
endfunction
