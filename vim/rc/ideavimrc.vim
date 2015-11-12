" normal map
  " move
  nnoremap <S-k> 10<UP>
  nnoremap <S-j> 10<DOWN>
  nnoremap <S-h> 10<LEFT>
  nnoremap <S-l> 10<RIGHT>
  
  " redo
  nnoremap <S-u> <C-r>

" visual map
  " move
  vnoremap <S-k> 10<UP>
  vnoremap <S-j> 10<DOWN>
  vnoremap <S-h> 10<LEFT>
  vnoremap <S-l> 10<RIGHT>
  
  " select all
  vnoremap , <ESC>ggVG
  
  " visual box
  vnoremap v <C-v>

" insert map
  " emacs (move)
  inoremap <C-a> <C-o>^
  inoremap <C-e> <C-o>$
  
  " emacs (edit)
  inoremap <C-h> <BS>
  inoremap <C-d> <Del>
  inoremap <C-k> <C-o><S-d>

" tab
  " switch
  nnoremap gh gT
  nnoremap gl gt

" jump
  " switch
  nnoremap tl <C-]>
  nnoremap th <C-t>
