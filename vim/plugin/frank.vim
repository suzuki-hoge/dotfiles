augroup frank
	autocmd!
	autocmd BufEnter workfile1.frank2 call KeyMapping()
	autocmd BufEnter workfile1.frank2 source $frank2/src/syntax.vim
augroup END

nnoremap <S-M-CR> :FF .<CR>
nnoremap <S-M-CR> :FF $frank<CR>
command! -nargs=1 -complete=dir FF call Dispatch(<f-args>)

function! Dispatch(path)
	let abspath = fnamemodify(a:path, ':p')[:-2]
	let depth = len(substitute(abspath, '[^/]', '', 'g'))
"
"	if abspath == expand('~')
"		call LauncherOpen()
"		return
"	endif
"
	if depth < 3
		echo 'too many files...'
		return
	endif

	if frank#window#checker#isFrank()
		echo 'frank is already opened.'
		return
	endif

	call frank#window#opener#open(abspath)
endfunction
