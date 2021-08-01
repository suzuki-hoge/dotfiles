# local
source $HOME/.dotfiles/zsh/local.zsh

# paths
setopt no_global_rcs

export DOTFILES

typeset -U path PATH
path=(
    $path                               # origins
    /opt/homebrew/bin(N-/)              # ARM64 brew bins
    /usr/local/bin                      # x86_64 brew bins
    $DOTFILES/git/bin
    $DOTFILES/vagrant/bin
    $DOTFILES/common/bin
    $DOTFILES/apps/find/bin
    $DOTFILES/apps/save-all/bin
    $DOTFILES/apps/calendar/bin
    $DOTFILES/apps/calculator/bin
    $DOTFILES/apps/task/bin
    $DOTFILES/apps/spelling/bin
    $DOTFILES/apps/dictionary/bin
    $DOTFILES/apps/poem-lint/bin
    $HOME/.local/bin                                    # stack
    $HOME/Dropbox/Developments/bin/activator/bin(N-/)   # activator
    $HOME/.nodebrew/current/bin(N-/)                    # npm
    $HOME/.rbenv/shims(N-/)                             # ruby
    $HOME/.pyenv/shims(N-/)                             # python
    $HOME/Library/Python/3.8/bin(N-/)                   # python
)

