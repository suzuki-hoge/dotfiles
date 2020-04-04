function! dot_hoge_editor#window#launch(found)
    " tag-master
    if getline(1, '$') != [''] || len(bufname('%')) != 0
        execute 'tabedit'
    endif
    call setline(1, dot_hoge_editor#read#tag_master())
    call s:buffer_configure('tag-master', 'modifiable')

    " pub
    execute &lines - 7 . 'sp pub'
    syntax match url 'http.*$'
    nnoremap <buffer> <CR> :call dot_hoge_editor#action#open_url()<CR>
    call setline(1, a:found.pubs)
    call s:buffer_configure_with_cursor_configure('pub', 'modifiable')

    " github
    execute '130vs github'
    autocmd CursorMoved <buffer> :call dot_hoge_editor#action#cursor_operate()
    syntax match inherited_message '-- inherited --'
    syntax match url               '^[^-].*$'
    nnoremap <buffer> <CR> :call dot_hoge_editor#action#open_github()<CR>
    call setline(1, a:found.githubs)
    call s:buffer_configure_with_cursor_configure('github', 'nomodifiable')

    " tag
    execute '100vs tag'
    autocmd CursorMoved <buffer> :call dot_hoge_editor#action#cursor_operate()
    syntax match own_tag        '\zs[a-zA-Z0-9][a-zA-Z0-9-]*\ze\(,\|$\)'
    syntax match inherited_tag  '\zs[^:]*:\ze'
    nnoremap <buffer> <CR> :call dot_hoge_editor#action#cd_on_tab_buf()<CR>
    call setline(1, a:found.tags)
    call s:buffer_configure_with_cursor_configure('tag', 'modifiable')

    " name
    execute '40vs name'
    autocmd CursorMoved <buffer> :call dot_hoge_editor#action#cursor_operate()
    syntax match inherited_dir  '\zs[a-zA-Z0-9-]\+\ze\/'
    syntax match own_dir        '[^\/][a-zA-Z0-9-]*$'
    nnoremap <buffer> <CR> :call dot_hoge_editor#action#cd_on_name_buf()<CR>
    call setline(1, a:found.names)
    call s:buffer_configure_with_cursor_configure('name', 'nomodifiable')

    " command
    call dot_hoge_editor#process#switch_buf('tag-master')
    execute '20vs command'
    nnoremap <buffer> <CR> :call dot_hoge_editor#action#command_execute()<CR>
    call setline(1, ['persist all', 'save tag-master', 'exit'])
    call s:buffer_configure('command', 'nomodifiable')

    call dot_hoge_editor#process#switch_buf('name')

    " syntax
    highlight url               cterm=underline ctermfg=21                gui=underline guifg=#4444ff              
    highlight inherited_message                 ctermfg=245                             guifg=#999999              
    highlight inherited_tag     cterm=bold      ctermfg=245               gui=bold      guifg=#999999              
    highlight own_tag           cterm=bold      ctermfg=165               gui=bold      guifg=#ff55ff              
    highlight inherited_dir     cterm=bold      ctermfg=245               gui=bold      guifg=#999999              
    highlight own_dir           cterm=bold      ctermfg=34                gui=bold      guifg=#00dd00              
    highlight CursorLine        cterm=none                   ctermbg=195                              guibg=#ccffff
endfunction


function! s:buffer_configure(name, modification)
	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
    if a:modification == 'modifiable' | setlocal modifiable
    else                              | setlocal nomodifiable
    endif

	silent file `=a:name`
endfunction


function! s:buffer_configure_with_cursor_configure(name, modification)
    call s:buffer_configure(a:name, a:modification)

	setlocal cursorline
    autocmd CursorMoved <buffer> :call dot_hoge_editor#action#cursor_operate()
endfunction

