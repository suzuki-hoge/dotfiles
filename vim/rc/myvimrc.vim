" vim:set ft=vim:

" dotfiles
let $dot = $HOME . '/.dotfiles'

" vim rc files
let $rc      = $dot . '/vim/rc/myvimrc.vim'
let $vimsubs = $dot . '/vim/rc/sub'

" tmp
let $tmp = $HOME . '/Documents/tmp'

" KeyRemap4MacBook - private.xml
let $private = $dot . '/Karabiner/private.xml'

" todo
let $todo = $HOME . '/Dropbox/todos/list.todo'

" blog-memo
let $blog = $HOME . '/Dropbox/todos/blog.todo'

" blog-draft
let $draft = $tmp . '/draft.html'

" plugins
let $plugin = $dot . '/vim/plugin'
let $frank  = $plugin . '/autoload/frank'
let $pete   = $plugin . '/autoload/pete'

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

" for autoload
let &runtimepath .= ',' . $plugin
