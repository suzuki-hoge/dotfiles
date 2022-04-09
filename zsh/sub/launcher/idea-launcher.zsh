function ij() {
  project=`python ~dot/zsh/sub/launcher/idea-projects.py | percol --match-method regex | xargs echo | cut -d'|' -f 2 | tr -d ' '`
  open -n -a 'IntelliJ IDEA.app' --args "'$project'"
}

