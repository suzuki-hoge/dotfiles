" enter
function! extension#html#enter()
    " run
    command! W call extension#html#run()

    " comment

    " snipet

    " tool
    command! TlBrowser call extension#html#browser()
endfunction

" leave
function! extension#html#leave()
    " run
    delcommand W

    " comment

    " snipet

    " tool
    delcommand TlBrowser
endfunction

" run
function! extension#html#run()
    call extension#common#writeAll()
    call lib#system#call($dot . '/apps/reload.app/Contents/MacOS/applet')
endfunction

" snipet

" tool
function! extension#html#browser()
    call extension#common#writeAll()
    call lib#system#call('open -a Google\ Chrome ', expand('%'))
endfunction
