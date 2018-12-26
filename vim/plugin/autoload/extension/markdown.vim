" enter
function! extension#markdown#enter()
    " run
    command! W call extension#markdown#run()

    " comment

    " snipet

    " tool
    command! TlBrowser call extension#markdown#browser()
endfunction

" leave
function! extension#markdown#leave()
    " run
    delcommand W

    " comment

    " snipet

    " tool
    delcommand TlBrowser
endfunction

" run
function! extension#markdown#run()
    call extension#common#writeAll()
    call system($dot . '/apps/reload.app/Contents/MacOS/applet')
endfunction

" snipet

" tool
function! extension#markdown#browser()
    call extension#common#writeAll()
    call lib#system#call('open -a Google\ Chrome ', expand('%'))
endfunction
