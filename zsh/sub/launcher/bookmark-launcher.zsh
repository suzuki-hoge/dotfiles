function bl() {
  if [ -n "$1" ]; then
    explicit=`python ~dot/zsh/sub/launcher/bookmark-parser.py keys | grep $1`

    if [ 1 -eq `echo $explicit | wc -l` ]; then
      key=$explicit
      val=`python ~dot/zsh/sub/launcher/bookmark-parser.py val "$key"`
    else
      key=`echo $explicit | percol --match-method regex | xargs echo`
      val=`python ~dot/zsh/sub/launcher/bookmark-parser.py val "$key"`
    fi
  else
    key=`python ~dot/zsh/sub/launcher/bookmark-parser.py keys | percol --match-method regex | xargs echo`
    val=`python ~dot/zsh/sub/launcher/bookmark-parser.py val "$key"`
  fi

  open $val
}

