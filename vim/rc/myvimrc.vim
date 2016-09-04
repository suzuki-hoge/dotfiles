" vim:set ft=vim:

" dotfiles
let $dot = $HOME . '/Dropbox/Developments/dotfiles'

" vim rc files
let $rc      = $dot . '/vim/rc/myvimrc.vim'
let $vimsubs = $dot . '/vim/rc/sub'

" path
let $tmp = $HOME . '/Dropbox/Documents/tmp'
let $vimsubs = $dot . '/vim/rc/sub'
let $devnote = $HOME . '/Dropbox/Developments/note/dev-note'

" KeyRemap4MacBook - private.xml
let $private = $dot . '/Karabiner/private.xml'

" todo
let $todo = $HOME . '/Dropbox/Documents/todos/list.todo'

" plugins
let $plugin   = $dot . '/vim/plugin'
let $frank    = $plugin . '/autoload/frank'
let $pete     = $plugin . '/autoload/pete'
let $markdown = $plugin . '/autoload/markdown'

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
