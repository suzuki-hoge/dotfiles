augroup frank
	autocmd!
	autocmd BufEnter workfile1.frank2 call KeyMapping()
	autocmd BufEnter workfile1.frank2 source $frank2/src/syntax.vim
augroup END

nnoremap <S-M-CR> :FF .<CR>
command! -nargs=1 -complete=dir FF call Dispatch(<f-args>)

source $frank/src/entry.vim
source $frank/src/actions/base.vim

source $frank/src/window/checker.vim
source $frank/src/window/printer.vim
source $frank/src/window/closer.vim
source $frank/src/window/opener.vim
source $frank/src/window/switcher.vim
source $frank/src/dirstack.vim

source $frank/launcher/src/main.vim

function! Dispatch(path)
	let abspath = fnamemodify(a:path, ':p')[:-2]
	let depth = len(substitute(abspath, '[^/]', '', 'g'))

	if abspath == expand('~')
		call LauncherOpen()
		return
	endif

	if depth < 3
		echo 'too many files...'
		return
	endif

	if IsFrank()
		echo 'frank is already opened.'
		return
	endif

	call OpenFrank(abspath)
endfunction
