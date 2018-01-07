# enable
autoload -U compinit
compinit

# view type
zstyle ':completion:*' format '%B%d%b'

# case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
