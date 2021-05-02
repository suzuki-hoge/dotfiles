function bl() {
  key=`python ~dot/zsh/sub/launcher/bookmark-parser.py keys | percol --match-method regex | xargs echo`
  val=`python ~dot/zsh/sub/launcher/bookmark-parser.py val "$key"`

  open $val
}

