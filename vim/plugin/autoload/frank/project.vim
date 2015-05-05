function! frank#project#open()
	if get(g:, '_frank_project', 'not selected') == 'not selected'
		call s:launcher()
	else
		execute 'F ' . g:_frank_project
	endif
endfunction

function! s:launcher()
	execute '20new'
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
	silent file `='Launcher'`

	let projects = readfile($frank . '/projects.frank')

	call lib#buffer#print(projects, 0)
	call Launcher_keymaps()
endfunction

function! Launcher_keymaps()
	nnoremap <buffer> <CR> :call ProjectSelect()<CR>
endfunction

function! ProjectSelect()
	let g:_frank_project = getline('.')

	execute 'cd ' . g:_frank_project

	execute 'bwipe'

	execute 'F'
endfunction
