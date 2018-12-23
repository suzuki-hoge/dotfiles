function! lib#List(xs)
    let d = type(a:xs) == type([]) ? {'xs': a:xs} : {'xs': split(a:xs, '\zs')}

    function d.map(s) dict
        let result = []

        for x in self.xs
            let result += [s:lambda(a:s).apply(x)]
        endfor
        
        return lib#List(result)
    endfunction

    function d.filter(s) dict
        let result = []

        for x in self.xs
            if s:lambda(a:s).apply(x)
                let result += [x]
            endif
        endfor
        
        return lib#List(result)
    endfunction

    function d.flatMap(s) dict
        let result = []

        for x in self.xs
            let result += s:lambda(a:s).apply(x)
        endfor
        
        return lib#List(result)
    endfunction

    function d.get() dict
        return self.xs
    endfunction

    function d.join(s) dict
        return join(self.xs, a:s)
    endfunction

    return d
endfunction

function! s:lambda(s)
    let f = {'s': a:s}

    function f.apply(x) dict
        return eval(self.s)
    endfunction

    return f
endfunction
