function! markdown#index#show()
    if expand('%:e') != 'md' && &filetype != 'md' | echo 'not markdown file.' | return | endif

    echo lib#list#list(getline(1, '$'))
       \.filter('a:x =~# "^#"')
       \.map("[len(split(a:x, '^#\\+\\zs')[0]), substitute(a:x, '^#\\+ \\+', '', 'g')]")
       \.map("repeat('  ', a:x[0] - 1) . a:x[1]")
       \.join("\n")
endfunction
