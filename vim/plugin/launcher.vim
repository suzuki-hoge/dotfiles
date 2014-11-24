let s:home_projects = [
	\'$plugin',
	\'$frank',
	\'$pete',
	\'',
	\'$vimsubs',
	\'$zshsubs',
	\'',
	\'$dev',
	\'$dev'
\]

let s:work_projects = [
	\'$dev',
	\'$dev'
\]

augroup launcher
	autocmd!
	autocmd FocusLost,TabLeave * if frank#checker#isLauncher() | execute 'bwipeout' | endif
augroup END

function! Launch()
	try
		call frank#checker#checkAlreadyLauncher()
		call frank#checker#checkAlreadyFrank()

		call s:new()

	catch /AlreadyFrank/
		echo 'frank is already opened.'

	catch /AlreadyLauncher/
		echo 'launcer is already opened.'
	endtry
endfunction

function! s:new()
	execute '20new'
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
	silent file `='launcher'`

	if lib#checker#isHome()
		let projects = s:home_projects
	else
		let projects = s:work_projects
	endif

	call lib#buffer#print(projects, 0)
	call frank#launcher#action#keymap()
endfunction
