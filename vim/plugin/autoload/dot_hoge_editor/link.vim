function! dot_hoge_editor#link#clean_all(dir)
    call system('rm -rf ' . a:dir . '*')
endfunction


function! dot_hoge_editor#link#apply(i, src_dir, link_dir, link_category, link_name, dst_name)
    let dst_dir = a:link_dir . '/' . a:link_category . '/' . a:link_name
    if !isdirectory(dst_dir)
        call mkdir(dst_dir, 'p')
    endif

    echo repeat(' ', 3 - len(a:i + 1)) . (a:i + 1) . ': ' . a:dst_name . ' <- ' . a:link_category . '/' . a:link_name
    call system('ln -s ' . a:src_dir . ' ' . dst_dir . '/' . a:dst_name)
endfunction

