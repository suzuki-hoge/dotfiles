augroup frank
	autocmd!
	"autocmd FocusLost,TabLeave * if frank#window#checker#isFrank() | call frank#window#closer#all() | endif
	"autocmd BufWipeout * if frank#window#checker#isFrank() | call frank#window#closer#all() | endif
augroup END

nnoremap <S-M-CR> :FF .<CR>
command! -nargs=1 -complete=dir FF call Dispatch(<f-args>)

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

	call frank#window#opener#full(abspath)
endfunction
