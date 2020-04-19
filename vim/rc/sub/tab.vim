" change tab
nnoremap gl gt
nnoremap gh gT

" new tab
nnoremap gk :tabedit 

" close tab
nnoremap gj :bdelete<CR>
nnoremap gJ :call lib#buffer#close('%', 'wq', 'q!')<CR>

