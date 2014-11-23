command!                        FFR call Dispatch('FFR')
command! -nargs=? -complete=dir FF  call Dispatch('FF', <f-args>)

let g:project_root = ''
let g:root_mode = 0

function! Dispatch(mode, ...)
	if frank#window#checker#isFrank()
		echo 'frank is already opened.'
		return
	endif

	if a:mode == 'FFR'
		if g:project_root == ''
			execute 'FFL'
		else
			call frank#window#opener#frank_full_root()
		endif
	endif

	if a:mode == 'FF'
		if a:0 == 0
			let reqpath = '.'
		else
			let reqpath = a:1
		endif

		let path = fnamemodify(reqpath, ':p')[:-2]
		let depth = len(substitute(path, '[^/]', '', 'g'))

		if depth < 3
			echo 'too many files...'
			return
		endif

		call frank#window#opener#frank_full(path)
	endif

endfunction
