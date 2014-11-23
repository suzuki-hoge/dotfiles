command!                        FFR call Dispatch('FFR')
command! -nargs=? -complete=dir FF  call Dispatch('FF', <f-args>)
command!                        FR  call Dispatch('FR')
command! -nargs=? -complete=dir F   call Dispatch('F', <f-args>)

let g:project_root = ''
let g:root_mode = 0

function! Dispatch(mode, ...) abort
	try
		call s:frankCheck()

		if a:mode == 'FFR'
			if g:project_root == ''
				execute 'FFL'
			else
				call frank#window#opener#frank_full_root()
			endif
		endif

		if a:mode == 'FF'
			let path = s:reqpath(a:000)

			call s:depthCheck(path)
			call s:existCheck(path)

			call frank#window#opener#frank_full(path)
		endif

		if a:mode == 'FR'
			if g:project_root == ''
				execute 'FL'
			else
				call frank#window#opener#frank_root()
			endif
		endif

		if a:mode == 'F'
			let path = s:reqpath(a:000)

			call s:depthCheck(path)
			call s:existCheck(path)

			call frank#window#opener#frank(path)
		endif

	catch /AlreadyFrank/
		echo 'frank is already opened.'

	catch /TooShallowDepth/
		echo 'too shallow.'

	catch /NotExistPath/
		echo 'request path is not exists.'
	endtry
endfunction

function! s:reqpath(arg)
	if a:arg == []
		let path = '.'
	else
		let path = a:arg[0]
	endif

	return fnamemodify(path, ':p')[:-2]
endfunction

function! s:frankCheck()
	if frank#window#checker#isFrank()
		throw 'AlreadyFrank'
	endif
endfunction

function! s:depthCheck(path)
	let depth = len(substitute(a:path, '[^/]', '', 'g'))

	if depth < 3
		throw 'TooShallowDepth'
	endif
endfunction

function! s:existCheck(path)
	if !isdirectory(a:path)
		throw 'NotExistPath'
	endif
endfunction
