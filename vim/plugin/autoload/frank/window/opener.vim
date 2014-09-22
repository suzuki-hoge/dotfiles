function! frank#window#opener#open(path)
	call frank#dirstack#new()

	call s:open3()
	call s:open2()
	call s:open1()

	call frank#dirstack#push(a:path)

	call frank#window#printer#to1(a:path)
endfunction

function! s:open1()
	execute 'vnew'
	call s:new(1)
	call frank#action#base#keymap()
	source $frank/syntax.vim
endfunction

function! s:open2()
	execute winheight(0) - 10 . 'new'
	call s:new(2)
endfunction

function! s:open3()
	if s:isBlank()
		execute 'enew'
	else
		execute 'tabnew'
	endif
	call s:new(3)
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
