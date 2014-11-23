function! frank#launcher#action#keymap()
	nnoremap <buffer> <CR> :call frank#launcher#action#select()<CR>
endfunction

function! frank#launcher#action#select()
	let project = getline('.')

	let g:project_root = project

	execute 'cd ' . project

	execute 'bwipe'

	if g:full_mode
		execute 'FFR'
	else
		execute 'FR'
	endif
endfunction
