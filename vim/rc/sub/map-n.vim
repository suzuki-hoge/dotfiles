" vim:set ft=vim:

" move
nnoremap <S-k> 10<UP>
nnoremap <S-j> 10<DOWN>
nnoremap <S-h> 10<LEFT>
nnoremap <S-l> 10<RIGHT>

" redo
nnoremap <S-u> <C-r>

" change window
nnoremap <Tab>   <C-w>w
nnoremap <S-Tab> <C-w>W

" Scrolling relative to cursor 
nnoremap ,, zz
nnoremap ,j zt
nnoremap ,k zb

" highlight under cursor word
nnoremap * :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
nnoremap g* :let @/ = expand('<cword>')<CR>:set hlsearch<CR>

" colon with !
nnoremap æ :!

" history search
nnoremap <C-p> :<UP>

" highlight off
nnoremap <silent><ESC><ESC> :noh<CR>

" reload vimrc
nnoremap ® :source $rc<CR>

" word yank
nnoremap yy yiw

" word paste
nnoremap yp :call WordPaste()<CR>

function! WordPaste()
	" delete word
	execute 'normal! diw'

	let _col  = col('.')
	let _line = getline('.')
	let _len  = len(_line)
	let _char = _line[_col - 1]

	" check cursor position
	if _col == _len && NotCloseBracket(_char)
		" at end of line, paste with p
		execute 'normal! "0p'
	else
		" else, paste with P
		execute 'normal! "0P'
	endif
endfunction

" check charactor
function! NotCloseBracket(_char)
	let brackets = ')}]>'

	for c in split(brackets, '\zs')
		if a:_char == c
			return 0
		endif
	endfor

	return 1
endfunction
