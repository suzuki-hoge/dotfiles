function! Frank2Open(path)
	call DSNew()

	call s:openWork3()
	call s:openWork2()
	call s:openWork1()

	call DSPush(a:path)

	call Remake(a:path)
endfunction

function! Remake(path)
	call CreateEntries(a:path)
	call WindowSwitch1()
	call s:outputEntries(a:path)
endfunction

function! CloseAll()
	call s:close(s:frank1)
	call s:close(s:frank2)
	call s:close(s:frank3)
endfunction

function! s:openWork1()
	execute 'vnew'
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
	silent file `='frank-1'`
	let s:frank1 = bufnr('')
endfunction

function! s:openWork2()
	execute winheight(0) - 10 . 'new'
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
	silent file `='frank-2'`
	let s:frank2 = bufnr('')
endfunction

function! s:openWork3()
	if s:isBlank()
		execute 'enew'
	else
		execute 'tabnew'
	endif
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
	silent file `='frank-3'`
	let s:frank3 = bufnr('')
endfunction

function! s:close(bufnum)
	if bufexists(a:bufnum)
		execute 'bwipeout! ' . a:bufnum
	endif
endfunction

function! WindowSwitch1()
	call s:windowSwitch(s:frank1)
endfunction

function! WindowSwitch2()
	call s:windowSwitch(s:frank2)
endfunction

function! WindowSwitch3()
	call s:windowSwitch(s:frank3)
endfunction

function! s:windowSwitch(bufnum)
	let l:winnum = bufwinnr(a:bufnum)
	execute winnum . 'wincmd w'
endfunction

function! s:isWork1()
	return !exists('s:frank1') ? 0 : bufnr('') == s:frank1
endfunction

function! s:isWork2()
	return !exists('s:frank2') ? 0 : bufnr('') == s:frank2
endfunction

function! s:isWork3()
	return !exists('s:frank3') ? 0 : bufnr('') == s:frank3
endfunction

function! IsFrank()
	return 1 == s:isWork1() + s:isWork2() + s:isWork3()
endfunction

function! s:isBlank()
	return bufname('%') == ''
endfunction

function! s:outputEntries(path)
	call s:clearnBuffer()
	call s:outputHead(a:path)
	call s:outputBody()
	call s:cursorAdjustWork1()
endfunction

function! s:clearnBuffer()
	execute '0,$delete _'
endfunction

function! s:outputHead(path)
	execute ':normal ggO'
	execute ':normal ' . len(a:path) . 'i-'
	call append(1, a:path)
	execute ':normal GO'
	execute ':normal ' . len(a:path) . 'i-'
endfunction

function! s:outputBody()
	for entry in g:entries
		call append('$', entry.output())
	endfor
endfunction

function! s:outputLines(lines)
	call append(0, a:lines)
	execute '$delete _'
endfunction

function! s:cursorAdjustWork1()
	execute 'normal 5gg0'
endfunction

function! s:cursorAdjustWork3()
	execute 'normal gg0'
endfunction

function! OutputLines(lines)
	call s:clearnBuffer()
	call s:outputLines(a:lines)
	call s:cursorAdjustWork3()
endfunction

function! ReadFile(path)
	call s:clearnBuffer()
	execute 'r ' . a:path
	execute '0delete _'
	let extension = fnamemodify(a:path, ':e')
	" tmp
	if extension == '' | let extension = 'vim' | endif
	let &filetype = extension
endfunction

function! DSNew()
	let s:directoryStacks = []
endfunction	

function! DSPush(path)
	let s:directoryStacks = s:directoryStacks + [a:path]
	return a:path
endfunction	

function! DSPop()
	if len(s:directoryStacks) != 1
		call remove(s:directoryStacks, -1)
	endif
	return s:directoryStacks[-1]
endfunction	

function! DSLast()
	return s:directoryStacks[-1]
endfunction	

function! LauncherOpenAtWork3(bookmarks)
	call WindowSwitch3()
	call s:close(s:frank3)
	call s:openBookmarks(a:bookmarks)
endfunction

function! s:openBookmarks(path)
	execute 'botright 10 split ' . a:path
	let s:frank3 = bufnr('')
endfunction
