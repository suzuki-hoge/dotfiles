command! PlusAll let line = getline('.') | let exp = substitute(line, '[ |,]\+', '+', 'g') | echo eval(substitute(exp, '+$', '', ''))
command! PS PlusAll

