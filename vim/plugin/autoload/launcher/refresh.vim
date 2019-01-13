function! launcher#refresh#subs(path)
    call s:refresh(['  ..'] + launcher#refresh#getSubs(a:path))
endfunction

function! launcher#refresh#getSubs(path)
    return s:dirs(a:path, "-not -name '.*'") + s:dirs(a:path, "-name '.*'") + s:files(a:path, "-not -name '.*'") + s:files(a:path, "-name '.*'")
endfunction

function! launcher#refresh#vimls()
    call s:refresh(s:files(launcher#viml#workspace(), "-name '*.viml'"))
endfunction

function! s:refresh(lines)
    execute 'normal ggdG'
    call setline('1', a:lines)
endfunction

function! s:dirs(path, pattern)
    return lib#system#asList('find', a:path, a:pattern, '-type d -maxdepth 1 | cut -b', len(a:path) + 2 . '-', '| sort --ignore-case | xargs -Idir echo "  dir/"')
endfunction

function! s:files(path, pattern)
    return lib#system#asList('find', a:path, a:pattern, '-type f -maxdepth 1 | cut -b', len(a:path) + 2 . '-', '| sort --ignore-case | xargs -Ifile echo "  file"')
endfunction
