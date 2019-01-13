" marking
nnoremap <silent>mm :<C-u>call <SID>marking()<CR>

" jump
nnoremap m '

" jump to Last Insert
nnoremap mli '^

" jump to Last Edit
nnoremap mle '.

" jump to nearest mark in upper marks
nnoremap mk ['

" jump to nearest mark in lower marks
nnoremap mj ]'

" show mark list
nnoremap mls :marks<CR>

" marker candidates
if !exists('g:markers')
    let g:markers = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
endif

" marking by auto increment alphabet
function! s:marking()
    if !exists('b:marker_index')
        let b:marker_index = 0
    else
        let b:marker_index = (b:marker_index + 1) % len(g:markers)
    endif
    execute 'mark' g:markers[b:marker_index]
    echo 'marked' g:markers[b:marker_index]
endfunction
