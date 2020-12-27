# local
source $HOME/.dotfiles/zsh/local.zsh

# globals
export DOTFILES
PATH=$PATH:$DOTFILES/git/bin
PATH=$PATH:$DOTFILES/vagrant/bin
PATH=$PATH:$DOTFILES/common/bin
PATH=$PATH:$DOTFILES/apps/find/bin
PATH=$PATH:$DOTFILES/apps/filterable-book/bin
PATH=$PATH:$DOTFILES/apps/tsv_to_json/bin
PATH=$PATH:$DOTFILES/apps/save-all/bin
PATH=$PATH:$DOTFILES/apps/calendar/bin
PATH=$PATH:$DOTFILES/apps/calculator/bin

# locals
PATH=$PATH:$HOME/.dotfiles/bin

# for brew
export PATH="/usr/local/bin:$PATH"

# for stack
export PATH="$PATH:$HOME/.local/bin"

# for activator
export PATH=$PATH:$HOME/Dropbox/Developments/bin/activator/bin 

# npm
export PATH=$PATH:$HOME/.nodebrew/current/bin

# ruby
export PATH=$HOME/.rbenv/shims:$PATH

# python
export PATH=$HOME/.pyenv/shims:$PATH
