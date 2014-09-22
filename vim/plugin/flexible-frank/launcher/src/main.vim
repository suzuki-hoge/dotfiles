augroup launcher
	autocmd!
	autocmd BufEnter bookmarks.frank2 call LauncherKeyMap()
augroup END

command! Launch call LauncherOpen()

source $frank/launcher/src/layout.vim
source $frank/launcher/src/actions.vim

" launcher
"function! LauncherOpenAtWork3(bookmarks)
"	call WindowSwitch3()
"	call s:close(s:frank3)
"	call s:openBookmarks(a:bookmarks)
"endfunction

"function! s:openBookmarks(path)
"	execute 'botright 10 split ' . a:path
"	let s:frank3 = bufnr('')
"endfunction
