# upper
alias ...='../../'
alias ....='../../../'
alias .....='../../../../'

# make and cd
function take() {
  mkdir -p $1
  cd $1
}

# interactive search and open finder
function dir() {
  local TARGET=`current_or $1`
  open $TARGET
}

# interactive search and cd
function cdf() {
  local ROOT=`current_or $1`
  local TARGET=`b-find -d $ROOT | bf`
  cd $ROOT/$TARGET
}

# recursive interactive search and cd
function cdfr() {
  local ROOT=`current_or $1`
  local TARGET=`b-find -d -r $ROOT | bf`
  cd $ROOT/$TARGET
}

# chaining cdp
function cdfc() {
  cdp
  x=`find . -type d -depth 1`
  if [ $#x -ne 0 ]; then
    cdpc
  fi
}

# copy full path
function fp() {
  if [ $# -eq 1 ]; then
    echo $(cd $(dirname $1); pwd)/$(basename $1) | tr -d '\n' | pbcopy
  else
    pwd | tr -d '\n' | pbcopy
  fi
}

