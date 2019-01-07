function! lib#log#show()
    if !exists('g:log') | echo 'no lines'
    else                | echo g:log      | end
endfunction

function! lib#log#append(label, s)
    if !exists('g:log') | let g:log = '' | end

    let g:log .= a:label . ': ' . a:s . "\n"
endfunction

command! Log call lib#log#show()
