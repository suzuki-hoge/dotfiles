function! lib#system#asList(...)
    let command = len(a:000) == 1 ? a:1 : join(a:000, ' ')
    echom command

    return split(system(command), '\n')
endfunction

function! lib#system#call(...)
    let command = len(a:000) == 1 ? a:1 : join(a:000, ' ')
    echom command

    call system(command)
endfunction

function! lib#system#echo(...)
    let command = len(a:000) == 1 ? a:1 : join(a:000, ' ')
    echom command

    echo system(command)
endfunction
