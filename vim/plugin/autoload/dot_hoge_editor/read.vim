function! dot_hoge_editor#read#tag(dir, sep)
    return substitute(s:read(a:dir . '/.hoge/.tag')[0], ',', a:sep, '')
endfunction


function! dot_hoge_editor#read#github(dir)
    let lines = s:read(a:dir . '/.git/config')

    if lines == ['']
        return ''
    else
        let found = filter(copy(lines), {_, line -> line =~ 'github' && line !~ 'gist'})

        if found == []
            return ''
        else
            return substitute(substitute(found[0], '^.*github.com[\/|:]', '', ''), '\.git', '', '')
        endif
    endif

endfunction


function! dot_hoge_editor#read#gist(dir)
    let lines = s:read(a:dir . '/.git/config')

    if lines == ['']
        return ''
    else
        let found = filter(copy(lines), {_, line -> line =~ 'gist'})

        if found == []
            return ''
        else
            return trim(substitute(substitute(substitute(found[0], 'url = ', '', ''), '\.git$', '', ''), '//[^@]*@', '//', ''))
        endif
    endif
endfunction


function! dot_hoge_editor#read#pub(dir)
    return s:read(a:dir . '/.hoge/.pub')[0]
endfunction


function! s:read(path)
    if filereadable(a:path) && readfile(a:path) != []
        return readfile(a:path)
    else
        return ['']
    endif
endfunction


function! dot_hoge_editor#read#any_dot_hoge_file_exists(dir)
    return filereadable(a:dir . '/.hoge/.tag') || filereadable(a:dir . '/.hoge/.pub')
endfunction


function! dot_hoge_editor#read#tag_master_dict()
    let result = {}

    for line in dot_hoge_editor#read#tag_master()
        let category = trim(split(line, ':')[0])
        for tag in split(split(line, ':')[1], ',')
            call extend(result, {trim(tag): category})
        endfor
    endfor

    return result
endfunction


function! dot_hoge_editor#read#tag_master()
    return readfile(g:dot_hoge_taggings_dir . '/.hoge/.tags')
endfunction

