source $frank/src/actions/edit.vim
source $frank/src/actions/point.vim
source $frank/src/actions/terminal.vim
source $frank/src/actions/open.vim
source $frank/src/actions/read.vim
source $frank/src/actions/directory.vim

function! KeyMapping()
	nnoremap <buffer> e  :call N_Edit()<CR>
	vnoremap <buffer> e  :call V_Edit()<CR>

	nnoremap <buffer> p  :call N_PointChange(1)<CR>
	vnoremap <buffer> p  :call V_PointChange(1)<CR>

	nnoremap <buffer> P  :call N_PointChange(0)<CR>
	vnoremap <buffer> P  :call V_PointChange(0)<CR>

	nnoremap <buffer> to :call N_TerminalOpen()<CR>
	nnoremap <buffer> tl :call N_TerminalListSegments()<CR>

	nnoremap <buffer> o  :call N_Open('open', 1)<CR>
	nnoremap <buffer> a  :call N_Open('open', 0)<CR>
	nnoremap <buffer> q  :call N_Open('qlmanage -p', 0)<CR>

	nnoremap <buffer> rd :call N_Read()<CR>

	nnoremap <buffer> h  :call N_DirUp()<CR>
	nnoremap <buffer> l  :call N_DirDown()<CR>
	nnoremap <buffer> -  :call N_DirPrev()<CR>
endfunction

function! GetOneByCursor()
	return g:entries[getpos('.')[1] - 5]
endfunction

function! GetByRange(first, last)
	return g:entries[ a:first - 5 : a:last - 5 ]
endfunction

function! GetByPoint()
	let result = []
	for entry in g:entries
		if entry.point
			let result = result + [entry]
		endif
	endfor
	return result
endfunction

function! Update(entry)
	execute a:entry.index . 'delete'
	call append(a:entry.index - 1, a:entry.output())
	execute 'normal ' . a:entry.index . 'gg0'
endfunction
