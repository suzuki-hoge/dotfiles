function! launcher#viml#workspace()
    return expand('~/.dotfiles/vim/launcher')
endfunction

function! launcher#viml#create(name)
    let path = launcher#viml#workspace() . '/' . a:name . '.viml'

    call lib#system#call('echo', $PWD, '>', path)
    for line in lib#list#range(1, bufnr('$')).filter('buflisted(a:x)').map("fnamemodify(bufname(a:x), ':p')").unique()
        call lib#system#call('echo', line, '>>', path) | endfor

    echo 'create: ' . a:name . '.viml'
endfunction
