" dotfiles
let $dot = $HOME . '/Dropbox/Developments/dotfiles'

" plugins
let $plugin   = $dot . '/vim/plugin'
let $frank    = $plugin . '/autoload/frank'
let $pete     = $plugin . '/autoload/pete'
let $markdown = $plugin . '/autoload/markdown'

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

" local
source $HOME/.dotfiles/vim/local.vim

" for autoload
let &runtimepath .= ',' . $plugin
