# interactive search and put to command line
function f_put_searched_history() {
  BUFFER=`history -n 1 | awk '!a[$0]++' | tail -r | percol --match-method regex --query "$LBUFFER"`
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N f_put_searched_history
bindkey '^O' f_put_searched_history

# search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
