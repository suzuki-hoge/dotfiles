function! calculator#process#calc_all()
    let exps = getline(1, line('$'))
    let results = map(exps, { _, exp -> calculator#process#calc(exp) })
    
    call calculator#process#switch_buf('result')
    execute 'normal ggdG'
    call append(0, results)
    execute 'normal Gdd'
    execute 'normal gg0'
    call calculator#process#switch_buf('exp')
endfunction


function! calculator#process#calc(exp)
    if trim(a:exp) == ''
        return ''
    else
        try
            return eval(calculator#process#implicit_add(a:exp))
        catch
            return '-'
        endtry
    endif
endfunction


function! calculator#process#implicit_add(exp)
    return substitute(a:exp, '\d\zs \+\ze\d', '+', 'g')
endfunction


function! calculator#process#auto_add() range
    silent normal gvy
    let exp = substitute(@@, '\n', ' ', 'g')

    echo calculator#process#calc(exp)
endfunction

function! calculator#process#switch_buf(name)
    execute bufwinnr(a:name) . 'wincmd w'
endfunction

