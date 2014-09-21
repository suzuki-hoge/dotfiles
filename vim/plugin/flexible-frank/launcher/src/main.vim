augroup launcher
	autocmd!
	autocmd BufEnter bookmarks.frank2 call LauncherKeyMap()
augroup END

command! Launch call LauncherOpen()

source $frank/launcher/src/layout.vim
source $frank/launcher/src/actions.vim
