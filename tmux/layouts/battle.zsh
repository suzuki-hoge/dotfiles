# battle レイアウト
# TM_SESSION, TM_DIR は tm -s から渡される
TM_START_DIR="/Users/ryo/Developments/miraito-program-battle"
TM_START_WINDOW="agent"

local base="$TM_START_DIR"

tmux new-session -d -s "$TM_SESSION" -c "$base" -n agent
tmux new-window -t "$TM_SESSION" -c "$base" -n git

# build: 3ペイン構成
tmux new-window -t "$TM_SESSION" -c "$base/frontend" -n build
# まず上下分割 (backend が下)
tmux split-window -t "$TM_SESSION:build" -v -c "$base/backend"
# 上ペインを選択して左右分割 (frontend が右)
tmux select-pane -t "$TM_SESSION:build.1"
tmux split-window -t "$TM_SESSION:build.1" -h -c "$base/frontend"
# 構造:
# pane1 | pane2  (frontend | frontend)
# -------------
# pane3          (backend)

