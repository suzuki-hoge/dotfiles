augroup launcher
	autocmd!
	autocmd BufEnter bookmarks.frank2 call LauncherKeyMap()
augroup END

command! Launch call LauncherOpen()

source $frank2/launcher/src/layout.vim
source $frank2/launcher/src/actions.vim