function! lib#system#asList(...)
    let response = s:call(a:000)

    return split(response, '\n')
endfunction

function! lib#system#call(...)
    call s:call(a:000)
endfunction

function! lib#system#echo(...)
    let response = s:call(a:000)

    echo response
endfunction

function! s:call(args)
    let request = join(a:args, ' ')
    call lib#log#append('request', request)

    let response = system(request)
    call lib#log#append('response', substitute(response, "\n", '\\n', 'g'))

    return response
endfunction
