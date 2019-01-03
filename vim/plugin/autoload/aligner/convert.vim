function! aligner#convert#toMarkdown(...) range
    let delim = len(a:000) == 1 ? a:1 : ','

    let selected = getline(a:firstline, a:lastline)

    let header = selected[0]
    let seps = lib#list#range(1, len(substitute(header, '[^' . delim . ']', '', 'g')) + 1).map("':--'").join(delim)
    let bodies = selected[1:]

    let response = s:apiCall([header] + [seps] + bodies, delim, ' | ')

    if response[0] != 'delimiter mismatch' | call lib#buffer#update(response, a:firstline, a:lastline)
    else                                   | echo join(response[0:1] + response[3:], "\n")           | endif
endfunction

function! aligner#convert#toCsv() range
    let selected = getline(a:firstline, a:lastline)

    let header = selected[0]
    let bodies = selected[2:]

    let response = s:apiCall([header] + bodies, '|', ', ')

    if response[0] != 'delimiter mismatch' | call lib#buffer#update(response, a:firstline, a:lastline)
    else                                   | echo join(response, "\n")                                 | endif
endfunction

function! aligner#convert#align(...) range
    if len(a:000) == 2 && (a:000[1] == 11 || a:000[1] == 01 || a:000[1] == 10 || a:000[1] == 00)
        let selected = getline(a:firstline, a:lastline)

        let orgDelim = a:000[0]
        if     a:000[1] == 11 | let dstDelim = ' ' . orgDelim . ' '
        elseif a:000[1] == 10 | let dstDelim = ' ' . orgDelim
        elseif a:000[1] == 01 | let dstDelim =       orgDelim . ' '
        elseif a:000[1] == 00 | let dstDelim =       orgDelim       | endif

        let response = s:apiCall(selected, orgDelim, dstDelim)

        if response[0] != 'delimiter mismatch' | call lib#buffer#update(response, a:firstline, a:lastline)
        else                                   | echo join(response, "\n")                                 | endif
    else
        echo join(['validation failure.', 'must be 2 args, and second args is only [11|01|10|00].'], "\n") | endif
endfunction

function! s:apiCall(lines, orgDelim, dstDelim)
    let line = substitute(join(a:lines, '\\n'), '`', '\\`', 'g')
"     echo line
"     return ['delimiter mismatch']
    return lib#system#asList($plugin . '/autoload/aligner/api/align', '"' . line . '"', '"' . a:orgDelim . '"', '"' . a:dstDelim . '"')
endfunction

function! s:update(lines, start, end, error)
    if a:lines[0] != a:error | call lib#buffer#update(a:lines, a:start, a:end)
    else                     | echo join([a:lines[0]] + a:lines[2:], "\n")     | endif
endfunction
