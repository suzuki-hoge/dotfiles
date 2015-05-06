let s:projects_path = $frank . '/projects.frank'


" from FL
" from FP
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
		inoremap <buffer> <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<C-x><C-f>"
		inoremap <buffer> <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-x><C-f>"

	catch /FrankExists/
		echo 'frank exists.'

	catch /LauncherExists/
		echo 'launcher exists.'
	endtry
endfunction


" from FP
" to   F project
" to   FL
function! frank#launcher#current_project()
	if exists("g:_frank_current_project")
		execute 'F ' . g:_frank_current_project
	else
		execute 'FL'
	endif
endfunction


" from Launcher <CR>
" to   F project
function! frank#launcher#select()
	let g:_frank_current_project = getline('.')

	execute 'cd ' . g:_frank_current_project
	execute 'bwipeout'

	execute 'F ' . g:_frank_current_project
endfunction


" from FLConfigure
function! frank#launcher#configure()
	execute '$tabedit ' . s:projects_path
	setlocal bufhidden=wipe
	setlocal nobuflisted
endfunction
