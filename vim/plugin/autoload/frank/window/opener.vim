function! frank#window#opener#full(path)
	let g:project_root_path = a:path

	call frank#dirstack#new()

	call s:open3()
	call s:open2()
	call s:open1()

	call frank#dirstack#push()

	call frank#window#printer#entries()
endfunction

function! s:open1()
	setlocal foldlevelstart=99
	execute 'vnew'
	call s:new(1)
	call frank#action#base#keymap()
	source $frank/syntax.vim
	call frank#window#folder#setopt()
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
