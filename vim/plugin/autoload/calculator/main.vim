function! calculator#main#calc()
    let selected = join(split(lib#buffer#selected(), '\n'), '')
    let result = eval(selected)
    echo result
    let @* = result
endfunction
