function bl() {
  if [ -n "$1" ]; then                                                       # 1 arg
    specified=`python ~dot/zsh/sub/launcher/bookmark-parser.py keys | grep $1`
    
    if [ "" = "$specified" ]; then                                             # no results
      key=`python ~dot/zsh/sub/launcher/bookmark-parser.py keys | percol --match-method regex | xargs echo`
      val=`python ~dot/zsh/sub/launcher/bookmark-parser.py val "$key"`
    elif [ 1 -eq `echo $specified | wc -l` ]; then                             # 1 result
      key=$specified
      val=`python ~dot/zsh/sub/launcher/bookmark-parser.py val "$key"`
    else                                                                       # more than 2 results
      key=`echo $specified | percol --match-method regex | xargs echo`
      val=`python ~dot/zsh/sub/launcher/bookmark-parser.py val "$key"`
    fi
  else                                                                       # no args
    key=`python ~dot/zsh/sub/launcher/bookmark-parser.py keys | percol --match-method regex | xargs echo`
    val=`python ~dot/zsh/sub/launcher/bookmark-parser.py val "$key"`
  fi

  open $val
}

