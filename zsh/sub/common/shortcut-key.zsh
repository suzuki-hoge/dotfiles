# command line stack
bindkey '^U' push-line

# edit by vi
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^[e' edit-command-line

# char jump like vim
bindkey '^[f' vi-find-next-char
bindkey '^[F' vi-find-prev-char

# insert last last word
autoload smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
zstyle :insert-last-word match '*([^[:space:]][[:alpha:]/\\]|[[:alpha:]/\\][^[:space:]])*'
bindkey '^[.' insert-last-word
