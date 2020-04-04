function! dot_hoge_editor#action#cd_on_name_buf()
    execute ':cd ' . expand(g:dot_hoge_taggings_dir) . '/' . expand(getline('.'))
    call dot_hoge_editor#action#close_all()
endfunction


function! dot_hoge_editor#action#cd_on_tab_buf()
    call dot_hoge_editor#process#switch_buf('name')
    let line = getline('.')
    call dot_hoge_editor#process#switch_buf('tag')
    execute ':cd ' . expand(g:dot_hoge_taggings_dir) . '/' . expand(line)
    call dot_hoge_editor#action#close_all()
endfunction


function! dot_hoge_editor#action#open_github()
    call system('open https://github.com/' . getline('.'))
endfunction


function! dot_hoge_editor#action#open_url()
    call system('open ' . split(getline('.'), ' : ')[1])
endfunction


function! dot_hoge_editor#action#command_execute()
    let line = getline('.')
    let orgbuf = bufname('%')
    let orgpos = getpos('.')
    
    if line == 'persist all'
        call dot_hoge_editor#process#write_dot_hoge_all()
        call dot_hoge_editor#process#link_dot_hoge_all()

        call dot_hoge_editor#process#switch_buf(orgbuf)
        call setpos('.', orgpos)

        echo 'persisted.'

    elseif line == 'save tag-master'
        call dot_hoge_editor#process#switch_buf('tag-master')

        let lines = getline(1, '$')
        call dot_hoge_editor#write#tag_master(lines)

        call dot_hoge_editor#process#switch_buf(orgbuf)
        call setpos('.', orgpos)

        echo 'saved.'

    elseif line == 'exit'
        call dot_hoge_editor#action#close_all()

        if getline(1, '$') == [''] || len(bufname('%')) == 0
            q
        endif
    endif
endfunction


function! dot_hoge_editor#action#close_all()
    call dot_hoge_editor#process#switch_buf('name')
    bd
    call dot_hoge_editor#process#switch_buf('tag')
    bd
    call dot_hoge_editor#process#switch_buf('github')
    bd
    call dot_hoge_editor#process#switch_buf('pub')
    bd
    call dot_hoge_editor#process#switch_buf('command')
    bd
    call dot_hoge_editor#process#switch_buf('tag-master')
    bd

    pwd
endfunction


function! dot_hoge_editor#action#cursor_operate()
    let n = line('.')
    let orgbuf = bufname('%')
    let orgpos = getpos('.')

    call dot_hoge_editor#process#switch_buf('name')
    call setpos('.', [0, n, 1, 0])
    redraw

    call dot_hoge_editor#process#switch_buf('tag')
    call setpos('.', [0, n, 1, 0])
    redraw

    call dot_hoge_editor#process#switch_buf('github')
    call setpos('.', [0, n, 1, 0])
    redraw

    call dot_hoge_editor#process#switch_buf('pub')
    call setpos('.', [0, n, 1, 0])
    redraw

    call dot_hoge_editor#process#switch_buf(orgbuf)
    call setpos('.', orgpos)
    redraw
endfunction

