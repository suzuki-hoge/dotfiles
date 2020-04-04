setlocal nonumber
setlocal bufhidden=wipe
setlocal nobuflisted
setlocal buftype=nofile

silent file `='calendar'`


syntax match sun       '\zs\d\+\ze<[^!]'
syntax match sun       'Su'
syntax match sat       '\zs\d\+\ze>[^!]'
syntax match sat       'Sa'
syntax match today_sun '\zs\d\+\ze<!'
syntax match today_sat '\zs\d\+\ze>!'
syntax match today     '\zs\d\+\ze !'
syntax match side      '\zs\d\+\ze#'
syntax match none      '<'
syntax match none      '>'
syntax match none      '#'
syntax match none      '!'


highlight sun       cterm=none           ctermfg=Red   gui=none           guifg=Red
highlight sat       cterm=none           ctermfg=Blue  gui=none           guifg=Blue
highlight today_sun cterm=bold,underline ctermfg=Red   gui=bold,underline guifg=Red
highlight today_sat cterm=bold,underline ctermfg=Blue  gui=bold,underline guifg=Blue
highlight today     cterm=bold,underline ctermfg=16    gui=bold,underline guifg=Black
highlight side      cterm=none           ctermfg=Gray  gui=none           guifg=Gray
highlight none      cterm=none           ctermfg=White gui=none           guifg=White


nnoremap <buffer> j :call calendar#process#next()<CR>
nnoremap <buffer> k :call calendar#process#prev()<CR>

