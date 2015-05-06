function! frank#actions#maps()
	nnoremap <buffer> e :call frank#actions#normal_leave_edit()<CR>
	vnoremap <buffer> e :call frank#actions#visual_leave_edit()<CR>

	nnoremap <buffer> E :call frank#actions#normal_stay_edit()<CR>
	vnoremap <buffer> E :call frank#actions#visual_stay_edit()<CR>

	nnoremap <buffer> o :call frank#actions#open()<CR>
	nnoremap <buffer> q :call frank#actions#qlook()<CR>

	nnoremap <buffer> c :call frank#actions#clipboard()<CR>
endfunction

function! frank#actions#normal_leave_edit()
	let n = line('.')

	execute 'bwipeout'

	execute '999tabedit ' . g:full[n]
endfunction

function! frank#actions#normal_stay_edit()
	let buf = bufnr('#')
	let n = line('.')

	execute '999tabedit ' . g:full[n]

	execute 'normal ' . buf. 'gt'
endfunction

function! frank#actions#visual_leave_edit() range
	execute 'bwipeout'

	for n in range(a:firstline, a:lastline)
		execute '999tabedit ' . g:full[n]
	endfor
endfunction

function! frank#actions#visual_stay_edit() range
	let buf = bufnr('#')
	for n in range(a:firstline, a:lastline)
		execute '999tabedit ' . g:full[n]
	endfor

	execute 'normal ' . buf. 'gt'
endfunction

function! frank#actions#open()
	let n = line('.')

	execute 'silent !open ' . g:full[n]
endfunction

function! frank#actions#qlook()
	let n = line('.')

	execute 'silent !qlmanage -p ' . g:full[n]
endfunction

function! frank#actions#clipboard()
	let n = line('.')

	let @* = g:full[n]
endfunction
