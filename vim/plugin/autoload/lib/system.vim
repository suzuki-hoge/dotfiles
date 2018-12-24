function! lib#system#asList(...)
    let command = len(a:000) == 1 ? a:1 : join(a:000, ' ')

    return split(system(command), '\n')
endfunction

function! lib#system#call(...)
    let command = len(a:000) == 1 ? a:1 : join(a:000, ' ')

    call system(command)
endfunction

function! lib#system#echo(...)
    let command = len(a:000) == 1 ? a:1 : join(a:000, ' ')

    echo system(command)
endfunction
