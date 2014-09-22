function! frank#launcher#action#keymap()
	nnoremap <buffer> cd   :call frank#launcher#action#cd()<CR>
	nnoremap <buffer> <CR> :call frank#launcher#action#ff()<CR>
endfunction

function! frank#launcher#action#cd()
	execute 'cd ' . getline('.')
endfunction

function! frank#launcher#action#ff()
	let path = getline('.')

	execute 'FF ' . path
endfunction
