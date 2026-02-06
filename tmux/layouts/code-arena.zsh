# code-arena レイアウト
# TM_SESSION, TM_DIR は tm -s から渡される
TM_START_DIR="/Users/ryo/Developments/miraito-code-arena"
TM_START_WINDOW="agent"

local base="$TM_START_DIR"

tmux new-session -d -s "$TM_SESSION" -c "$base" -n agent
tmux new-window -t "$TM_SESSION" -c "$base" -n zsh
tmux new-window -t "$TM_SESSION" -c "$base/frontend" -n front
tmux new-window -t "$TM_SESSION" -c "$base/backend" -n back
tmux new-window -t "$TM_SESSION" -c "$base/frontend" -n front
tmux new-window -t "$TM_SESSION" -c "$base/backend" -n back
