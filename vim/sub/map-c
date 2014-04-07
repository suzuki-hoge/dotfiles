" vim:set ft=vim:

" history search (beginning search)
cnoremap <C-p> <UP>
cnoremap <C-n> <DOWN>

" expand current directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

" expand 'normal'
cnoremap <expr> ## getcmdtype() == ':' ? 'normal ' : '##'

" expand under cursor word
cnoremap <expr> && getcmdtype() == ':' ? expand('<cword>') : '&&'
