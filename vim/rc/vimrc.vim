" local
source $HOME/.dotfiles/vim/local.vim

" plugins
let $plugin   = $dot . '/vim/plugin'

" for autoload
let &runtimepath .= ',' . $plugin

" subs
let $vimsubs = $dot . '/vim/rc/sub'
source $vimsubs/autocommands.vim
source $vimsubs/commands.vim
source $vimsubs/map-c.vim
source $vimsubs/map-i.vim
source $vimsubs/map-n.vim
source $vimsubs/map-v.vim
source $vimsubs/mark.vim
source $vimsubs/plugin.vim
source $vimsubs/options.vim
source $vimsubs/tab.vim

function! Dic() 
    let w = expand("<cword>")
    execute '!d ' . w
endfunction
command! D call Dic()

function! Goo() 
    let l = getline('.')
    if l =~ 'http*'
        execute '!open ' . l
    else
        execute '!open "https://www.google.com/search?q=' . l . '"'
    endif
endfunction
command! G call Goo()

function! Trc() 
    echo '書類'
endfunction
command! T call Trc()
