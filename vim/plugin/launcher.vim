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
	autocmd FocusLost,TabLeave * if frank#checker#isLauncher() | execute 'bwipeout' | endif
augroup END

function! Launch()
	try
		call frank#checker#checkAlreadyLauncher()
		call frank#checker#checkAlreadyFrank()

		call s:new()

	catch /AlreadyFrank/
		echo 'frank is already opened.'

	catch /AlreadyLauncher/
		echo 'launcer is already opened.'
	endtry
endfunction

function! s:new()
	execute '20new'
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
	silent file `='launcher'`
	call lib#buffer#print(s:projects, 0)
	call frank#launcher#action#keymap()
endfunction
