function el() {
  project=`python ~dot/zsh/sub/launcher/idea-projects.py projects | percol --match-method regex | xargs echo`

  dir=`python ~dot/zsh/sub/launcher/idea-projects.py path "$project"`

  open -n -a 'IntelliJ IDEA.app' --args "'$dir'"
}

