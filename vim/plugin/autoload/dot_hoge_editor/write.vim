function! dot_hoge_editor#write#tag(dir, tag)
    return s:write(a:dir . '/.hoge/', '.tag', join(uniq(split(a:tag, ',')), ','))
endfunction


function! dot_hoge_editor#write#pub(dir, pub)
    return s:write(a:dir . '/.hoge/', '.pub', a:pub)
endfunction


function! dot_hoge_editor#write#tag_master(lines)
    return writefile(a:lines, g:dot_hoge_taggings_dir . '/.hoge/.tags')
endfunction


function! s:write(dir, file, line)
    if !isdirectory(a:dir)
        call mkdir(a:dir, 'p')
    endif

    call writefile([a:line], a:dir . a:file)
endfunction

