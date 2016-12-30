command! MI            call markdown_index#main#main()
command! MarkdownIndex call markdown_index#main#main()

let g:indices = []

function! markdown_index#main#main()
    let g:indices = markdown_index#convert#get_indices()

    call markdown_index#window#open()

    call s:put_indices(markdown_index#convert#to_lines(g:indices))
endfunction

function! s:put_indices(lines)
    call markdown_index#window#focus_index()
    call setline('1', a:lines)
endfunction

function! markdown_index#main#jump()
    let lineNum = line('.') - 1
    bwipeout
    call setpos('.', [0, g:indices[lineNum]['lineNum'], 0, 0])
endfunction
