" move
nnoremap <S-k> 10<UP>
nnoremap <S-j> 10<DOWN>
nnoremap <S-h> 10<LEFT>
nnoremap <S-l> 10<RIGHT>

" redo
nnoremap <S-u> <C-r>

" change window
nnoremap <Tab>   <C-w>w
nnoremap <S-Tab> <C-w>W

" Scrolling relative to cursor 
nnoremap zj zt
nnoremap zk zb

" highlight under cursor word
nnoremap * :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
nnoremap g* :let @/ = expand('<cword>')<CR>:set hlsearch<CR>

" colon with !
nnoremap æ :!

" history search
nnoremap <C-p> :<UP>

" highlight off
nnoremap <silent><ESC><ESC> :noh<CR>

" word yank
nnoremap yy yiw

" word paste
nnoremap yp viwp

" rewrite all
nnoremap c, ggcG
