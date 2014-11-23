command!                        FFR call Dispatch('FFR')
command! -nargs=? -complete=dir FF  call Dispatch('FF', <f-args>)
command!                        FR  call Dispatch('FR')
command! -nargs=? -complete=dir F   call Dispatch('F', <f-args>)

let g:project_root = ''
let g:root_mode = 0
let g:full_mode = 0

function! Dispatch(mode, ...) abort
	try
		call frank#checker#checkAlreadyFrank()

		if a:mode == 'FFR'
			let g:full_mode = 1

			if g:project_root == ''
				call Launch()
			else
				let g:root_mode = 1
				call frank#window#opener#frank_full_root()
			endif
		endif

		if a:mode == 'FF'
			let path = s:reqpath(a:000)

			call frank#checker#checkTooShallowDepth(path)
			call frank#checker#checkNotExistPath(path)

			let g:full_mode = 1
			let g:root_mode = 0
			call frank#window#opener#frank_full(path)
		endif

		if a:mode == 'FR'
			let g:full_mode = 0

			if g:project_root == ''
				call Launch()
			else
				let g:root_mode = 1
				call frank#window#opener#frank_root()
			endif
		endif

		if a:mode == 'F'
			let path = s:reqpath(a:000)

			call frank#checker#checkTooShallowDepth(path)
			call frank#checker#checkNotExistPath(path)

			let g:full_mode = 0
			let g:root_mode = 0
			call frank#window#opener#frank(path)
		endif

	catch /AlreadyFrank/
		echo 'frank is already opened.'

	catch /TooShallowDepth/
		echo 'too shallow path.'

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
