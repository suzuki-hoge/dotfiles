" move
nnoremap <S-k> 10<UP>
nnoremap <S-j> 10<DOWN>
nnoremap <S-h> 10<LEFT>
nnoremap <S-l> 10<RIGHT>

vnoremap <S-k> 10<UP>
vnoremap <S-j> 10<DOWN>
vnoremap <S-h> 10<LEFT>
vnoremap <S-l> 10<RIGHT>

" redo
nnoremap <S-u> <C-r>

" search
nnoremap * *N

" select all
vnoremap , <ESC>ggVG

" visual box
vnoremap v <C-v>

" emacs move
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" emacs edit
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k> <C-o><S-d>

" tab
nnoremap gh gT
nnoremap gl gt
nnoremap gj :q<CR>

" jump
nnoremap tl :action GotoDeclaration<CR>
nnoremap tL :action GotoImplementation<CR>
nnoremap th :action Back<CR>

" comment
nnoremap ? :action CommentByLineComment<CR>:action VimMotionUp<CR>
vnoremap ? :action CommentByLineComment<CR>

" editor action
nnoremap <Space>n :action RenameElement<CR>
vnoremap <Space>n :action RenameElement<CR>

nnoremap <Space>r :action Replace<CR>
vnoremap <Space>r :action Replace<CR>

nnoremap <Space>R :action ReplaceInPath<CR>
vnoremap <Space>R :action ReplaceInPath<CR>

nnoremap <Space>f :action Find<CR>
vnoremap <Space>f :action Find<CR>

nnoremap <Space>F :action FindInPath<CR>
vnoremap <Space>F :action FindInPath<CR>

nnoremap <Space>u :action FindUsages<CR>
vnoremap <Space>u :action FindUsages<CR>

nnoremap <Space>l :action ReformatCode<CR>

nnoremap <Space><Space> :action CodeCompletion<CR>

nnoremap <Space><CR> :action ShowIntentionActions<CR>

" reload
nnoremap <Space>s :source ~/.ideavimrc<CR>

