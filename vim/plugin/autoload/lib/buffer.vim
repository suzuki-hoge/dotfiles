function! lib#buffer#update(putting, start, end)
    execute a:start . ',' . a:end . 'd'
    call append(a:start - 1, a:putting)
endfunction

function! lib#buffer#selected()
    let tmp = @*
    execute 'silent normal gvy'
    let selected = @*
    let @* = tmp
    return selected
endfunction

function! lib#buffer#close(buf, own, others)
    if s:isOwn(a:buf) | execute a:own
    else              | execute a:others | endif
endfunction

function! s:isOwn(buf)
    return buflisted(bufnr(a:buf)) && bufname(a:buf) != ''
endfunction
