let s:api = $frank . '/api/dist/build/frank/frank '


" form F
" from FP
" from Launcher <CR>
" to   frank arg
" to   frank .
" to   FP
function! frank#main#open(...)
	let arg = get(a:000, 0, '.')

	try
		let path = lib#path#fullpath(arg)

		call frank#check#too_shallow(path)
		call frank#check#exist_directory(path)
		call frank#check#frank_exists()
		call frank#check#launcher_exists()

		call s:open_frank()

		let indented = s:indented(path)
		call lib#buffer#print(indented, 0)

		let g:full = s:full(path)

	catch /TooShallowDepth/
		execute 'FP'

	catch /NotExistPath/
		echo 'not exist path.'

	catch /FrankExists/
		echo 'frank exists.'

	catch /LauncherExists/
		echo 'launcher exists.'
	endtry
endfunction


function! s:indented(path)
	return system(s:api . a:path . ' indent')
endfunction


function! s:full(path)
	return ['geta'] + split(system(s:api . a:path . ' full'))
endfunction


function! s:open_frank()
	execute '45vnew'
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
	silent file `='Frank'`

	call frank#actions#maps()
	source $frank/syntax.vim

	set foldmarker={,}
	set foldmethod=marker
	set foldlevel=999
endfunction
