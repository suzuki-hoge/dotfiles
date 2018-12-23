" vim:set ft=vim:

" message
command! M messages

" toggle relative/absolute line number
command! Rel setlocal relativenumber!

" reload browser
command! R silent !open $dot/apps/reload.app

" markdown syntax
command! Md set ft=markdown

" open browser
command! B silent !/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --new-window %
