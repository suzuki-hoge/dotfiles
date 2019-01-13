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

"
" test
"

call lib#test#assert(lib#list#list([1, 2, 3, 4, 5]).map('a:x + 1').filter('a:x % 2 == 0').flatMap('[a:x, a:x]').get(), [2, 2, 4, 4, 6, 6])
call lib#test#assert(lib#list#list('foo').map("a:x . '!'").map('toupper(a:x)').join(''), 'F!O!O!')

function! s:foo(x)
    return a:x % 2 == 0 ? 'even' : 'odd'
endfunction

call lib#test#assert(lib#list#range(1, 3).mapF(function('s:foo')).unique(), ['even', 'odd'])
