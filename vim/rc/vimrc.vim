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
