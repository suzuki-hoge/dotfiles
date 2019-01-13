function! markdown#index#show()
    if expand('%:e') != 'md' && &filetype != 'md' | echo 'not markdown file.' | return | endif

    let lines = lib#string#emptyQuoting(getline(1, line('$')), '^```', '```')

    let result = [] " [n, depth, title]
    for i in range(0, len(lines) - 1)
        if lines[i] =~# '^#'
            let result = result + [[i, len(split(lines[i], '^#\+\zs')[0]), substitute(lines[i], '^#\+ \+', '', 'g')]] | endif | endfor

    let max = result[-1][0]

    for e in result
        echo lib#string#padl(e[0] + 1, len(max), ' ') . ' ' . repeat('  ', e[1] - 1) . e[2] | endfor
endfunction
