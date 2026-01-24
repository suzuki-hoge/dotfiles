# tmux レイアウト

## tm コマンド

| オプション | 説明                  |
|-------|---------------------|
| (なし)  | カレントディレクトリ名でセッション作成 |
| `-l`  | セッション一覧             |
| `-a`  | セッション選択してアタッチ       |
| `-s`  | レイアウトファイルからセッション作成  |
| `-d`  | セッション選択して削除         |
| `-r`  | tmux.conf 再読み込み     |

## レイアウトファイル

`layouts/` に `.zsh` ファイルを配置すると `tm -s` で選択できる。

### 変数

| 変数                | 必須   | 説明                                    |
|-------------------|------|---------------------------------------|
| `TM_START_DIR`    | -    | 起動時に cd するディレクトリ                      |
| `TM_START_WINDOW` | -    | アタッチ時に開くウィンドウ名                        |
| `TM_SESSION`      | (自動) | tm -s が自動でセット（レイアウトファイル名）             |
| `TM_DIR`          | (自動) | tm -s が自動でセット（TM_START_DIR または $HOME） |

### 基本構造

```zsh
# レイアウト名
TM_START_DIR="/path/to/project"
TM_START_WINDOW="main"

local base="$TM_START_DIR"

# セッション作成（-d でデタッチ状態）
tmux new-session -d -s "$TM_SESSION" -c "$base" -n main

# ウィンドウ追加
tmux new-window -t "$TM_SESSION" -c "$base" -n sub
```

### ペイン分割

```zsh
# 上下分割 (-v)
tmux split-window -t "$TM_SESSION:ウィンドウ名" -v -c "$base"

# 左右分割 (-h)
tmux split-window -t "$TM_SESSION:ウィンドウ名" -h -c "$base"

# 特定ペインを分割（ペイン番号は 1 から）
tmux select-pane -t "$TM_SESSION:ウィンドウ名.1"
tmux split-window -t "$TM_SESSION:ウィンドウ名.1" -h -c "$base"
```

### 例: 3ペイン構成

```zsh
# build: 3ペイン構成
tmux new-window -t "$TM_SESSION" -c "$base/frontend" -n build
tmux split-window -t "$TM_SESSION:build" -v -c "$base/backend"
tmux select-pane -t "$TM_SESSION:build.1"
tmux split-window -t "$TM_SESSION:build.1" -h -c "$base/frontend"
# 結果:
# pane1 | pane2
# -------------
# pane3
```

## 注意

- ウィンドウ名に `run` は使わない（tmux が正しく処理しない場合がある）
- ペイン番号は `pane-base-index` の設定に依存（現在は 1 から開始）
