let b:stay = 0
let b:leave = 1

function! frank#actions#maps()
	nnoremap <buffer> e :call frank#actions#edit(b:stay)<CR>
	vnoremap <buffer> e :call frank#actions#edit(b:stay)<CR>

	nnoremap <buffer> E :call frank#actions#edit(b:leave)<CR>
	vnoremap <buffer> E :call frank#actions#edit(b:leave)<CR>

	nnoremap <buffer> o :call frank#actions#open('!open', b:stay)<CR>
	nnoremap <buffer> O :call frank#actions#open('!open', b:leave)<CR>

	nnoremap <buffer> q :call frank#actions#open('!qlmanage -p', b:stay)<CR>
	nnoremap <buffer> Q :call frank#actions#open('!qlmanage -p', b:leave)<CR>

	nnoremap <buffer> c :call frank#actions#clipboard()<CR>
endfunction

function! frank#actions#edit(is_leave) range
	let nums = range(a:firstline, a:lastline)

	if a:is_leave
		execute 'bwipeout'
		call s:tabedit_(nums)
	else
		let buf = bufnr('#')
		call s:tabedit_(nums)
		execute 'normal ' . buf. 'gt'
	endif
endfunction

function! s:tabedit_(nums)
	for num in a:nums
		execute '999tabedit ' . g:full[num]
	endfor
endfunction

function! frank#actions#open(command, is_leave)
	let n = line('.')

	if a:is_leave
		execute 'bwipeout'
	endif

	execute 'silent ' . a:command . ' ' . g:full[n]
endfunction

function! frank#actions#clipboard()
	let n = line('.')

	let @* = g:full[n]
endfunction
