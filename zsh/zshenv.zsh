# dotfiles
DOTFILES=~/Dropbox/Developments/dotfiles

# my wrappers
export DOTFILES
PATH=$PATH:$DOTFILES/git/bin
PATH=$PATH:$DOTFILES/vagrant/bin
PATH=$PATH:$DOTFILES/common/bin
PATH=$PATH:$DOTFILES/apps/dictionary/bin
PATH=$PATH:$DOTFILES/apps/find/bin

# for brew
export PATH="/usr/local/bin:$PATH"

# for stack
export PATH="$PATH:$HOME/.local/bin"

# for activator
export PATH=$PATH:$HOME/Dropbox/Developments/bin/activator/bin 

# for filterable book
export PATH=$PATH:$HOME/Dropbox/Developments/tool/filterable-book/src

# npm
export PATH=$PATH:$HOME/.nodebrew/current/bin
