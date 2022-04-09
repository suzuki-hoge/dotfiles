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
alias -g E='&& exit'
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

