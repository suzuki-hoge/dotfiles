function! launcher#main#subs()
    call s:open()
    call launcher#refresh#subs('.')
endfunction

function! launcher#main#vimls()
    call s:open()
    call launcher#refresh#vimls()
endfunction

function! s:open()
    " new buffer
    if getline(1, '$') != [''] || len(bufname('%')) != 0
        execute 'tabedit'
    endif

    " buffer
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
    let &cmdheight = &lines / 3
	silent file `='InteractiveFilter'`

    " command
    nnoremap <buffer> s       :call launcher#action#show(line('.'))<CR>
    nnoremap <buffer> <Space> :call launcher#action#choice()<CR>
    nnoremap <buffer> <CR>    :call launcher#action#fix()<CR>

    " autocmd
    augroup launcher
        autocmd!
        autocmd BufLeave <buffer> set cmdheight=2
    augroup END

    " syntax
    syntax match directory "\.\.$"
    syntax match directory ".*\/$"

    highlight link directory Comment
endfunction
