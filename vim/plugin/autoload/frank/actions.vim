function! frank#actions#maps()
	nnoremap <buffer> e :call frank#actions#leave_edit()<CR>
	nnoremap <buffer> E :call frank#actions#stay_edit()<CR>
endfunction

function! frank#actions#leave_edit()
	let n = line('.')

	execute 'bwipeout'

	execute '$tabedit ' . g:full[n]
endfunction

function! frank#actions#stay_edit()
	let n = line('.')

	execute '$tabedit ' . g:full[n]

	execute 'normal gt'
endfunction
