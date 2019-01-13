function! calculator#main#calc()
    let selected = join(split(lib#buffer#selected(), '\n'), '')
    call lib#log#append('selected: ', selected)

    let result = eval(selected)
    call lib#log#append('result: ', result)

    echo result
    let @* = result
endfunction
