" vim:set ft=vim:

" edit todo
command! Todo tabe $todo

" message
command! M messages

" toggle relative/absolute line number
command! Rel setlocal relativenumber!

" reload browser
command! Reload silent !open $dot/apps/chrome.app
