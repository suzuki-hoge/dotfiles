let s:bookmarks = [
			\'/Users/ryo/.dotfiles/vim/plugin',
			\'/Users/ryo/.dotfiles/vim/plugin/autoload/frank/',
			\'/Users/ryo/.dotfiles/vim/plugin/autoload/frank/launcher/',
			\'',
			\'/Users/ryo/.dotfiles/vim/rc/sub/',
			\'',
			\'/Users/ryo/.dotfiles/zsh/sub'
\]

augroup launcher
	autocmd!
	autocmd FocusLost,TabLeave * if s:isLauncher() | execute 'bwipeout' | endif
augroup END

command! FFL call Launch()

function! Launch()
	if s:isLauncher()
		echo 'launcher is already opend.'
		return
	endif

	if frank#window#checker#isFrank()
		return
	endif

	call s:new()
endfunction

function! s:isLauncher()
	return bufname('%') == 'launcher'
endfunction

function! s:new()
	execute '20new'
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
	silent file `='launcher'`
	call append(1, s:bookmarks)
	execute '0delete _'
	call frank#launcher#action#keymap()
endfunction
