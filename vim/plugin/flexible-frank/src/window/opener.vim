function! OpenFrank(path)
	call DSNew()

	call s:openWork3()
	call s:openWork2()
	call s:openWork1()

	call DSPush(a:path)

	call PrintEntries(a:path)
endfunction

function! s:openWork1()
	execute 'vnew'
	call s:new(1)
	let g:frank1 = bufnr('')
endfunction

function! s:openWork2()
	execute winheight(0) - 10 . 'new'
	call s:new(2)
	let g:frank2 = bufnr('')
endfunction

function! s:openWork3()
	if s:isBlank()
		execute 'enew'
	else
		execute 'tabnew'
	endif
	call s:new(3)
	let g:frank3 = bufnr('')
endfunction

function! s:new(n)
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
	silent file `='frank-' . a:n`
endfunction

function! s:isBlank()
	return bufname('%') == ''
endfunction
