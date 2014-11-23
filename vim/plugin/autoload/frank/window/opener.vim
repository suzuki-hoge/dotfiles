function! frank#window#opener#frank_full_root()
	let g:root_mode = 1
	call frank#window#opener#full(g:project_root)
endfunction

function! frank#window#opener#frank_full(path)
	let g:root_mode = 0
	call frank#window#opener#full(a:path)
endfunction

function! frank#window#opener#frank_root()
	echo 'FR'
endfunction

function! frank#window#opener#frank(path)
	echo 'F'
endfunction




function! frank#window#opener#full(path)
	let g:current_path = a:path

	call frank#dirstack#new()

	call s:open3()
	call s:open2()
	call s:open1()

	call frank#dirstack#push(a:path)

	call frank#window#printer#entries(a:path)
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
	execute winheight(0) - 15 . 'new'
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
