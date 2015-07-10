" vim:set ft=vim:

" edit todo
command! Todo tabe $todo

" edit blog-memo
command! Blog tabe $blog

" edit blog-draft
command! Draft tabe $draft

" message
command! M messages

" toggle relative/absolute line number
command! Rel setlocal relativenumber!

" reload browser
command! Reload silent !open $dot/apps/chrome.app
