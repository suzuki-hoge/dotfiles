let s:main = $frank . '/api/main '

function! frank#main#open(...)
	let arg = get(a:000, 0, '.')

	try
		let path = lib#path#fullpath(arg)

		call frank#check#too_shallow(path)
		call frank#check#exist_directory(path)
		call frank#check#frank_exists()
		call frank#check#launcher_exists()

		call s:new()

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
	return system(s:main . a:path . ' indented')
endfunction

function! s:full(path)
	return ['geta'] + split(system(s:main . a:path . ' full'))
endfunction

function! s:new()
	setlocal foldlevelstart=99
	execute '45vnew'
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
	silent file `='Frank'`

	call frank#actions#maps()
	source $frank/syntax.vim
endfunction
