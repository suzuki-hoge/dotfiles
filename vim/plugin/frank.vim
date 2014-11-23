augroup frank
	autocmd!
augroup END

nnoremap <S-M-CR> :FF .<CR>
command! -nargs=1 -complete=dir FF call Dispatch(<f-args>)

let g:project_root = ''

function! Dispatch(path)
	let abspath = fnamemodify(a:path, ':p')[:-2]
	let depth = len(substitute(abspath, '[^/]', '', 'g'))

	if abspath == expand('~')
		call Launch()
		return
	endif

	if depth < 3
		echo 'too many files...'
		return
	endif

	if frank#window#checker#isFrank()
		echo 'frank is already opened.'
		return
	endif

	call frank#window#opener#frank_full(abspath)
endfunction


" if '' => launcher
command! FFR call frank#window#opener#frank_full_root()
