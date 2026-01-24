# reload zsh configs
alias reload='source ~/.zshrc'

# launch editor
alias ed='open -n -a "IntelliJ IDEA 2.app" --args .'

# vertical ls
function l() {
  ls -1 $1
}

# vertical ls with dotfiles
function la() {
  ls -1A $1
}

# preview
function qlook() {
  qlmanage -p $1 >& /dev/null
}

# interactive search and edit
function vif() {
  local ROOT=`current_or $1`
  local TARGET=`b-find -f $ROOT | bf`
  if [ ${#TARGET} != 0 ]; then
    vi $ROOT/$TARGET
  fi
}

# recursive interactive search and edit
function vifr() {
  local ROOT=`current_or $1`
  local TARGET=`b-find -f -r $ROOT | bf`
  if [ ${#TARGET} != 0 ]; then
    vi $ROOT/$TARGET
  fi
}

# global alias
alias -g G='| grep'
alias -g V='| grep -v'
alias -g F='| bf | xargs'
alias -g E='&& exit'
alias -g C="| tr -d '\n' | pbcopy"
alias -g CC='| pbcopy'
alias -g X='| xargs'
alias -g L='| wc -l'
alias -g O='| xargs open'

# alias
alias dp='docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}" | sort'

# working directory or specified path
function current_or() {
  if [ -z $1 ];then
    echo .
  else
    echo $1
  fi
}

# initialize dot hoge
function dh() {
  mkdir -p .hoge
  echo 'unfixed' > .hoge/.tag
  echo 'active' >> .hoge/.tag
  touch .hoge/.pub

  dir=`basename $(pwd)`
  ln -sf ~/Dropbox/Taggings/control-tab ~/Dropbox/Links/status/active
}

# echo paths
function paths() {
  echo $PATH | tr : '\n'
}

# extend which
function wch() {
  result=`type $1`

  if [ "`echo $result | grep 'not found'`" ]; then
    echo 'not found'
  elif [ "`echo $result | grep 'shell builtin'`" ]; then
    echo 'shell built-in'
  else
    found=`echo $result | rev | cut -d ' ' -f 1 | rev`
    dir=`dirname $found`
    if [ $# = 1 ]; then
      echo $found
    elif [ $2 = 'ls' ]; then
      ls $dir
    elif [ $2 = 'dir' ]; then
      echo $dir
    elif [ $2 = 'cd' ]; then
      cd $dir
    elif [ $2 = 'vi' ]; then
      if [ "`file $found | grep 'ASCII text'`" ]; then
        vi $found
      else
        echo 'not a text'
      fi
    fi
  fi
}

vs() {
  osascript <<'EOF'
    tell application "iTerm2"
        activate
        if (count of windows) = 0 then
            create window with default profile
        end if
        tell current session of current window
            split vertically with same profile
        end tell
    end tell
EOF
}

sp() {
  osascript <<'EOF'
    tell application "iTerm2"
      activate
      if (count of windows) = 0 then
          create window with default profile
      end if
      tell current session of current window
          split horizontally with same profile
      end tell
    end tell
EOF
}

function ss() {
  local dir filename ts file latest qlook_mode=0

  dir="./tmp-screen-shot"

  # -q オプションのチェック
  if [[ "$1" == "-q" ]]; then
    qlook_mode=1
    shift
  fi

  # qlook モードの場合
  if [[ $qlook_mode -eq 1 ]]; then
    if [[ -n "$1" ]]; then
      # ファイル名が指定された場合
      file="$dir/$1.png"
    else
      # ファイル名が指定されなかった場合は latest を使う
      file="$dir/latest.png"
    fi

    if [[ ! -f "$file" ]]; then
      echo "Error: file not found: $file" >&2
      return 1
    fi

    qlmanage -p "$file" >/dev/null 2>&1
    return 0
  fi

  # 以降は既存の保存処理
  mkdir -p -- "$dir" || {
    echo "Error: cannot create directory: $dir" >&2
    return 1
  }

  if [[ -n "$1" ]]; then
    # ファイル名が指定された場合
    filename="$1.png"
  else
    # ファイル名が指定されなかった場合
    ts="$(date +%Y%m%d-%H%M%S)"
    filename="ss-$ts.png"
  fi

  file="$dir/$filename"
  latest="$dir/latest.png"

  if ! pngpaste "$file" >/dev/null 2>&1; then
    [[ -f "$file" ]] && rm -f -- "$file"
    echo "Error: failed to save image from clipboard. Is there an image in the clipboard?" >&2
    return 1
  fi

  # latest を更新
  cp -- "$file" "$latest"

  echo "Saved:   $file"
  echo "Updated: $latest"
}

function tm() {
  case "$1" in
    -l)
      # セッション一覧
      tmux list-sessions 2>/dev/null || echo "no sessions"
      ;;
    -a)
      # セッション選択して attach
      local sessions=$(tmux list-sessions -F '#{session_name}' 2>/dev/null)
      if [[ -z "$sessions" ]]; then
        echo "no sessions"
        return
      fi
      local session=$(echo "$sessions" | bf)
      [[ -n "$session" ]] && tmux attach -t "$session"
      ;;
    -s)
      # 事前定義レイアウトで起動
      local layouts_dir="$HOME/Dropbox/dotfiles/tmux/layouts"
      local layouts=$(ls "$layouts_dir" 2>/dev/null | sed 's/\.zsh$//')
      if [[ -z "$layouts" ]]; then
        echo "no layouts"
        return
      fi
      local layout=$(echo "$layouts" | bf)
      if [[ -n "$layout" ]]; then
        local layout_file="$layouts_dir/$layout.zsh"
        export TM_SESSION="$layout"
        export TM_DIR="$HOME"
        source "$layout_file"
        tmux attach -t "$TM_SESSION"
      fi
      ;;
    -d)
      # セッション選択して削除
      local sessions=$(tmux list-sessions -F '#{session_name}' 2>/dev/null)
      if [[ -z "$sessions" ]]; then
        echo "no sessions"
        return
      fi
      local session=$(echo "$sessions" | bf)
      [[ -n "$session" ]] && tmux kill-session -t "$session"
      ;;
    -r)
      # 設定反映
      tmux source ~/.tmux.conf && echo "reloaded"
      ;;
    *)
      # デフォルト: カレントディレクトリ名でセッション起動
      local base_name=$(basename "$PWD")
      local session_name="$base_name"

      if tmux has-session -t "$session_name" 2>/dev/null; then
        # 既存セッションがある場合、連番で新規作成
        local n=2
        while tmux has-session -t "$base_name $n" 2>/dev/null; do
          ((n++))
        done
        session_name="$base_name $n"
      fi

      tmux new-session -s "$session_name"
      ;;
  esac
}

