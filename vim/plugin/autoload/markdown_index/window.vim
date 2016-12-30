function! markdown_index#window#open()
    set splitright
    
    50vnew
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
	silent file `='Index'`

    nnoremap <buffer> <CR> :call markdown_index#main#jump()<CR>
endfunction

function! markdown_index#window#focus_index()
    execute bufwinnr('Index') . 'wincmd w'
endfunction
