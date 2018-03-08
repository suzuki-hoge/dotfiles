# reload zsh configs
alias reload='source ~/.zshrc'

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

# replace editor commands
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias view="/Applications/MacVim.app/Contents/MacOS/view"
alias vdiff="/Applications/MacVim.app/Contents/MacOS/vimdiff"
alias mvim="/Applications/MacVim.app/Contents/MacOS/MacVim"

# interactive search and edit
function vip() {
  local ROOT=`current_or $1`
  local TARGET=`find.py $ROOT -f | percol --match-method regex`
  vi $ROOT/$TARGET
}

# recursive interactive search and edit
function vipr() {
  local ROOT=`current_or $1`
  local TARGET=`find.py $ROOT -f -r | percol --match-method regex`
  vi $ROOT/$TARGET
}

# global alias
alias -g G='| grep'
alias -g V='| grep -v'
alias -g P='| percol --match-method regex | xargs'
alias -g E='| exit'
alias -g C="| tr -d '\n' | pbcopy"
alias -g CC='| pbcopy'
alias -g X='| xargs'
alias -g L='| wc -l'
alias -g O='| xargs open'

# working directory or specified path
function current_or() {
  if [ -z $1 ];then
    echo .
  else
    echo $1
  fi
}

# look up a word in a dictionary
function d() {
  dictionary.py $*
}

# search global notes
function fg() {
  filterable_book.sh global $1
}

# search local notes
function fl() {
  filterable_book.sh local $1
}
