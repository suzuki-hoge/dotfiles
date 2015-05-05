let s:main = $frank . '/api/main '

function! frank#main#open(...)
	if a:000 == []
		let path = '.'
	else
		let path = a:1
	endif

	try
		call frank#check#too_shallow(path)

		call s:new()

		let indented = s:indented(path)
		call lib#buffer#print(indented, 0)

		let g:full = s:full(path)

	catch /TooShallowDepth/
		echo 'too shallow path.'
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
endfunction
