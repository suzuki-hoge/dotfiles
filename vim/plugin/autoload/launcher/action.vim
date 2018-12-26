function! launcher#action#show(n)
    let content = s:asContent(a:n)

    if content.type == 'directory'
        echo join(launcher#refresh#getSubs(content.path)[:&cmdheight - 1], "\n")
        return | endif

    if content.type == 'viml'
        execute 'cd ' . launcher#viml#workspace() | endif

    call lib#system#echo('head -n', &cmdheight - 1, content.path)
endfunction

function! launcher#action#choice()
    let currentContent = s:asContent(line('.'))

    if currentContent.type == 'directory'
        execute 'cd ' . currentContent.path

        call launcher#refresh#subs('.')

        echo ''

    elseif currentContent.type == 'file'
        execute currentContent.status == 'not selected' ? 'normal 0r+' : 'normal 0r '
        execute 'normal j'

        echo ''

    elseif currentContent.type == 'viml'
        execute 'cd ' . launcher#viml#workspace()

        call s:editAll([currentContent.path]) | endif

endfunction

function! launcher#action#fix()
    let selectedContents = lib#list#range(1, line('$')).mapF(function('s:asContent')).filter('a:x.status == "selected"').get()

    let currentContent = s:asContent(line('.'))

    if len(selectedContents) != 0
        call s:editAll(map(selectedContents, "v:val.path"))

    elseif currentContent.type == 'directory'
        execute 'cd ' . currentContent.path
        execute 'bd'

        echo ''

    elseif currentContent.type == 'file'
        call s:editAll([currentContent.path])

    elseif currentContent.type == 'viml'
        execute 'cd ' . launcher#viml#workspace()

        let lines = lib#system#asList('cat', currentContent.path)

        execute 'cd ' . lines[0]
        call s:editAll(lines[1:]) | endif

endfunction

function! s:asContent(n)
    let line = getline(a:n)

    let status = line[0] == ' ' ? 'not selected' : 'selected'
    let path = line[2:]
    if isdirectory(path)       | let type = 'directory'
    elseif path[-4:] == 'viml' | let type = 'viml'
    else                       | let type = 'file' | endif

    return {'status': status, 'path': path, 'type': type}
endfunction

function! s:editAll(paths)
    let buffer = bufnr('%')

    for path in a:paths
        execute 'tabedit ' . path | endfor

    execute 'bd ' . buffer
    if len(a:paths) > 1
        execute 'normal ' . (len(a:paths) - 1) . 'gT' | endif
endfunction
