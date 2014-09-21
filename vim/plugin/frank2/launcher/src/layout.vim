let s:bookmarks = $frank2 . '/launcher/workfiles/bookmarks.frank2'

function! LauncherOpen()
	if s:isLauncher()
		echo 'launcher is already opend.'
		return
	endif

	if IsFrank()
		call LauncherOpenAtWork3(s:bookmarks)
		return
	endif

	execute 'topleft 15 split ' . s:bookmarks
endfunction

function! s:isLauncher()
	return s:bookmarks == bufname('%')
endfunction
