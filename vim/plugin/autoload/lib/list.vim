function! lib#list#list(xs)
    let d = type(a:xs) == type([]) ? {'xs': a:xs} : {'xs': split(a:xs, '\zs')}

    function d.map(s) dict
        let result = []

        for x in self.xs
            let result += [s:lambda(a:s).apply(x)] | endfor
        
        return lib#list#list(result)
    endfunction

    function d.mapF(f) dict
        let result = []

        for x in self.xs
            let result += [a:f(x)] | endfor
        
        return lib#list#list(result)
    endfunction

    function d.filter(s) dict
        let result = []

        for x in self.xs
            if s:lambda(a:s).apply(x)
                let result += [x] | endif | endfor
        
        return lib#list#list(result)
    endfunction

    function d.flatMap(s) dict
        let result = []

        for x in self.xs
            let result += s:lambda(a:s).apply(x) | endfor
        
        return lib#list#list(result)
    endfunction

    function d.get() dict
        return self.xs
    endfunction

    function d.join(s) dict
        return join(self.xs, a:s)
    endfunction

    function d.unique() dict
        let tmp = {}

        for x in self.xs
            let tmp[x] = '' | endfor

        return keys(tmp)
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

function! lib#list#range(start, end)
    return lib#list#list(range(a:start, a:end))
endfunction
