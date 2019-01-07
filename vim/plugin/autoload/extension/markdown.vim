" enter
function! extension#markdown#enter()
    " run
    command! W call extension#markdown#run()

    " comment

    " snipet
    command! -nargs=? SniQuote call extension#markdown#quote(<f-args>)

    " tool
    command! TlBrowser call extension#markdown#browser()
endfunction

" leave
function! extension#markdown#leave()
    " run
    delcommand W

    " comment

    " snipet
    delcommand SniQuote

    " tool
    delcommand TlBrowser
endfunction

" run
function! extension#markdown#run()
    call extension#common#writeAll()
    call lib#system#call($dot . '/apps/reload.app/Contents/MacOS/applet')
endfunction

" snipet
function! extension#markdown#quote(...)
    let lang = len(a:000) == 1 ? a:1 : ''

    call extension#common#snipet([
\       '```' . lang,
\       '```'
\   ])
    execute 'normal kk'
endfunction

" tool
function! extension#markdown#browser()
    call extension#common#writeAll()
    call lib#system#call('open -a Google\ Chrome ', expand('%'))
endfunction
