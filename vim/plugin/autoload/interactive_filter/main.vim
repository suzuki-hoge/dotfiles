function! interactive_filter#main#launch(isViml)
    call s:open()
    call s:reflesh(a:isViml ? s:vimls() : s:subs('.'))
endfunction

function! s:open()
    if getline(1, '$') != [''] || len(bufname('%')) != 0
        execute 'tabedit'
    endif

	setlocal bufhidden=wipe
	setlocal nobuflisted
	setlocal buftype=nofile
    let &cmdheight = &lines / 3

	silent file `='InteractiveFilter'`

    nnoremap <buffer> s       :call interactive_filter#main#show(line('.'))<CR>
    nnoremap <buffer> <Space> :call interactive_filter#main#enter(1 == 0)<CR>
    nnoremap <buffer> <CR>    :call interactive_filter#main#enter(1 == 1)<CR>

    augroup launcher
        autocmd!
        autocmd BufLeave <buffer> set cmdheight=2
    augroup END

    syntax match directory "\.\.$"
    syntax match directory ".*\/$"

    highlight link directory Comment
endfunction

function! s:reflesh(lines)
    execute 'normal ggdG'
    call setline('1', a:lines)
endfunction

function! s:subs(path)
    return map(
\       ['..']
\           + split(system("find " . a:path . " -type d -maxdepth 1 -not -name '.*' | cut -b " . (len(a:path) + 2) . "- | sort --ignore-case | xargs -Idir echo dir/"), '\n')
\           + split(system("find " . a:path . " -type d -maxdepth 1      -name '.*' | cut -b " . (len(a:path) + 2) . "- | sort --ignore-case | xargs -Idir echo dir/"), '\n')
\           + split(system("find " . a:path . " -type f -maxdepth 1 -not -name '.*' | cut -b " . (len(a:path) + 2) . "- | sort --ignore-case"), '\n')
\           + split(system("find " . a:path . " -type f -maxdepth 1      -name '.*' | cut -b " . (len(a:path) + 2) . "- | sort --ignore-case"), '\n'),
\       '"  " . v:val'
\   )
endfunction

function! s:vimls()
    cd ~/.dotfiles/vim/launcher
    return map(
\       split(system("find . -name '*.viml' | cut -b 3- | sort --ignore-case"), '\n'),
\       '"  " . v:val'
\   )
endfunction

function! interactive_filter#main#enter(isFixed)
    let selectedContents = filter(
\       map(
\           range(1, line('$')),
\           's:asContent(v:val)'
\       ),
\       'v:val.status == "selected"'
\   )

    let currentContent = s:asContent(line('.'))

    if len(selectedContents) != 0 && a:isFixed
        call s:editAll(map(selectedContents, "v:val.path"))

    elseif currentContent.type == 'directory'
        execute 'cd ' . currentContent.path

        call s:reflesh(s:subs('.'))

        if a:isFixed
            execute 'bd'
        endif

    elseif currentContent.type == 'file' && !a:isFixed
        if currentContent.status == 'not selected'
            execute 'normal 0r+'
        else
            execute 'normal 0r '
        endif
        execute 'normal j'
        echo ''

    elseif currentContent.type == 'file' && a:isFixed
        call s:editAll([currentContent.path])

    elseif currentContent.type == 'viml' && a:isFixed
        let lines = split(system('cat ' . currentContent.path), '\n')

        execute 'cd ' . lines[0]
        call s:editAll(lines[1:])

    elseif currentContent.type == 'viml' && !a:isFixed
        echo 'empty action'

    endif
endfunction

function! s:asContent(n)
    let line = getline(a:n)
    let status = line[0] == ' ' ? 'not selected' : 'selected'
    let path = line[2:]
    if isdirectory(path)
        let type = 'directory'
    elseif path[-4:] == 'viml'
        let type = 'viml'
    else
        let type = 'file'
    endif
    return {'status': status, 'path': path, 'type': type}
endfunction

function! s:editAll(paths)
    let buffer = bufnr('%')

    for path in a:paths
        execute 'tabedit ' . path
    endfor

    execute 'bd ' . buffer
    if len(a:paths) > 1
        execute 'normal ' . (len(a:paths) - 1) . 'gT'
    endif
endfunction

function! interactive_filter#main#show(n)
    let content = s:asContent(a:n)

    if content.type == 'directory'
        echo join(s:subs(content.path)[:&cmdheight - 1], "\n")

    else
        echo system('head -n ' . (&cmdheight - 1) . ' ' . content.path)

    endif
endfunction

function! interactive_filter#main#mkviml(name)
    let currentBuffer = bufnr('%')

    execute 'tablast'
    let lastBuffer = bufnr('%')

    call system('echo ' . $PWD . ' > ' . '~/.dotfiles/vim/launcher/' . a:name . '.viml')

    while 1 == 1
        execute 'tabnext'
        call system('echo "' . expand('%:p') . '" >> ' . '~/.dotfiles/vim/launcher/' . a:name . '.viml')
        if bufnr('%') == lastBuffer
            break
        endif
    endwhile

    execute 'normal ' . currentBuffer . 'gt'

    echo 'create: ' . a:name . '.viml'
endfunction
