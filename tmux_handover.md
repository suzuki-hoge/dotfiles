# tmux 導入・設計メモ（引き継ぎ用）

## 前提・思想

- **Terminal.app のタブが主役**
- **tmux は「落ちない裏側（セッション保持層）」として使う**
- スクロールは **Terminal.app のスクロール**を使用（tmux copy-mode 前提ではない）
- 1 Terminal タブ = 1 tmux セッション
- プロジェクト単位でセッションを分ける

### 想定運用

```
Terminal tab1 -> tmux session: pj-foo
  win1: git
  win2: claude

Terminal tab2 -> tmux session: pj-bar
  win1: git
  win2: claude
```

- タブ = プロジェクト
- ウィンドウ = 同一プロジェクト内の作業切り替え
- ペインは例外的に使用

---

## tmux の理解メモ

- tmux は **ターミナルとシェルの間に入る「仮想ターミナル層」**
- tmux 自身はシェルではなく、pty を作って zsh を起動しているだけ
- `.zshrc` 等がそのまま使えるのは、zsh が通常の対話シェルとして起動しているため

### セッションとクライアントの重要な制約

- 1 セッションには複数 client が attach できる
- ただし **セッションごとに「現在表示中の window」は共有**
- 同一セッションで
  - client A は win1
  - client B は win2
  を同時表示、ということはできない

---

## zsh 関数 `tm`

### 仕様

- `tm`
  - カレントディレクトリ名をセッション名として tmux を起動
  - 既存セッションがあれば attach
- `tm -l`
  - セッション一覧
- `tm -a`
  - セッション一覧から選んで attach（自作のパスが通っている fzf ライクコマンド bf を使う）
- `tm -s`
  - 事前定義レイアウトでセッションを起動 ( 同じく bf を使う )
- `tm -d`
  - セッション一覧から選んでセッション削除

### 実装

```zsh
todo
zsh/sub/common/command.zsh に実装して
```

---

## レイアウト定義（tm -s）

配置場所：本リポジトリの tmux/layouts/<session>.zsh

### 例：pj-foo

```zsh
tmux new-session -d -s "$TM_SESSION" -c "$TM_DIR" -n git
tmux new-window -t "$TM_SESSION" -c "$TM_DIR" -n claude

tmux new-window -t "$TM_SESSION" -c "$TM_DIR" -n logs
tmux split-window -t "$TM_SESSION:logs" -v -c "$TM_DIR"
tmux send-keys -t "$TM_SESSION:logs.2" "tail -f ./logs/app.log" C-m

tmux select-window -t "$TM_SESSION:git"
```

とりあえず battle というレイアウトを作ってほしい
win1: /Users/ryo/Developments/miraito-program-battle で開く
win2: /Users/ryo/Developments/miraito-program-battle で開く
win3: pane1 を /Users/ryo/Developments/miraito-program-battle/frontend
win3: pane2 を /Users/ryo/Developments/miraito-program-battle/frontend
win3: pane3 を /Users/ryo/Developments/miraito-program-battle/backend
win3 の構造は↓
```
pane1 | pane2
-------------
pane3
```
---

## tmux 操作の設定

### window（タブ相当）

prefix を何か決める ( C-b は嫌なので試しに C-space )
window-table という独自 key table を作る

- prefix + w + l: window 一覧
- prefix + w + n: window 作成 ( できる？ )
- prefix + w + j / k: window 次/前
- prefix + w + 1..9: window 番号指定
- prefix + w + r: window 名前変更
- prefix + w + e: window 終了
- prefix + w + u: window 戻る
- prefix + w + U: window 戻るの戻る

### pane（必要なときだけ）

pange-table という独自 key table を作る

- prefix + p + s: 左右分割
- prefix + p + v: 上下分割
- prefix + p + hjkl: ペイン移動 ( vim like )
- prefix + p + e: ペイン終了
- prefix + p + u: ペイン戻る
- prefix + p + U: ペイン戻るの戻る
- prefix + p + f: 一時最大化

---

## tmux.conf（最小）

```tmux
todo

window 番号は 1 から
win と page は同じディレクトリで開く
```

---

