# battle レイアウト
# TM_SESSION, TM_DIR は tm -s から渡される

local base="/Users/ryo/Developments/miraito-program-battle"

tmux new-session -d -s "$TM_SESSION" -c "$base" -n win1
tmux new-window -t "$TM_SESSION" -c "$base" -n win2

# win3: 3ペイン構成
tmux new-window -t "$TM_SESSION" -c "$base/frontend" -n win3
# まず上下分割 (backend が下)
tmux split-window -t "$TM_SESSION:win3" -v -c "$base/backend"
# 上ペインを選択して左右分割 (frontend が右)
tmux select-pane -t "$TM_SESSION:win3.1"
tmux split-window -t "$TM_SESSION:win3.1" -h -c "$base/frontend"
# 構造:
# pane1 | pane2  (frontend | frontend)
# -------------
# pane3          (backend)

tmux select-window -t "$TM_SESSION:win1"
