" vim:set ft=vim:

" dotfiles
let $dot = $HOME . '/.dotfiles'

" vim rc files
let $rc      = $dot . '/vim/rc/myvimrc'
let $vimsubs = $dot . '/vim/rc/sub'

" plugin
let $plugin         = $dot . '/vim/plugin'
let $pete           = $plugin . '/petronius-the-arbiter'

" tmp
let $tmp = $HOME . '/Documents/tmp'

" zsh rc files
let $zshsubs = $dot . '/zsh/sub'

" development 
let $dev = $HOME . '/Development'

" workspace
let $workspace = $HOME . '/Documents/workspace'

" KeyRemap4MacBook - private.xml
let $private = $HOME . '/Library/Application Support/KeyRemap4MacBook/private.xml'

" todo
let $todo = $HOME . '/Dropbox/todos/list.todo'

" blog-memo
let $blog = $HOME . '/Dropbox/todos/blog.todo'

" blog-draft
let $draft = $tmp . '/draft.html'

" import vimsubs
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
source $vimsubs/tagbar.vim
source $vimsubs/vundle.vim

let $autoload  = $plugin . '/autoload'
let $frank     = $autoload . '/frank'

let &runtimepath .= ',' . $plugin
