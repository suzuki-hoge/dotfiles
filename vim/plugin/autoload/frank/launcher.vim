let s:projects_path = $frank . '/projects.frank'

function! frank#launcher#selector()
	try
		call frank#check#frank_exists()
		call frank#check#launcher_exists()

		execute '20new'
		setlocal bufhidden=wipe
		setlocal nobuflisted
		setlocal buftype=nofile
		silent file `='Launcher'`

		let projects = readfile(s:projects_path)
		call lib#buffer#print(projects, 0)

		nnoremap <buffer> <CR> :call frank#launcher#select()<CR>

	catch /FrankExists/
		echo 'frank exists.'

	catch /LauncherExists/
		echo 'launcher exists.'
	endtry
endfunction


function! frank#launcher#current_project()
	if exists("g:_frank_current_project")
		call s:open_current_project()
	else
		call frank#launcher#selector()
	endif
endfunction


function! frank#launcher#select()
	let g:_frank_current_project = getline('.')

	execute 'cd ' . g:_frank_current_project
	execute 'bwipeout'

	call s:open_current_project()
endfunction


function! frank#launcher#configure()
	execute '$tabedit ' . s:projects_path
	setlocal bufhidden=wipe
	setlocal nobuflisted
endfunction


function s:open_current_project()
	execute 'F ' . g:_frank_current_project
endfunction
