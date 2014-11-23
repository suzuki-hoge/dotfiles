let s:projects = [
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

command! FFL call Launch(1)
command! FL  call Launch(0)

function! Launch(mode)
	if s:isLauncher()
		echo 'launcher is already opend.'
		return
	endif

	if frank#window#checker#isFrank()
		echo 'frank is already opened.'
		return
	endif

	let g:full_mode = a:mode

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
	call append(1, s:projects)
	execute '0delete _'
	call frank#launcher#action#keymap()
endfunction
