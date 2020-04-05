setlocal bufhidden=wipe
setlocal nobuflisted
setlocal buftype=nofile
silent file `='exp'`

vnoremap <buffer> <CR> :call calculator#process#auto_add()<CR>
nnoremap <buffer> gj :qa<CR>

execute 'rightbelow 80vs result'

setlocal bufhidden=wipe
setlocal nobuflisted
setlocal buftype=nofile

vnoremap <buffer> <CR> :call calculator#process#auto_add()<CR>
nnoremap <buffer> gj :qa<CR>

