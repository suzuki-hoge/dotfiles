function! lib#buffer#update(putting, start, end)
    execute a:start . ',' . a:end . 'd'
    call append(a:start - 1, a:putting)
endfunction
