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
function cdp() {
  local ROOT=`current_or $1`
  local TARGET=`find.py $ROOT -d | percol --match-method regex`
  cd $ROOT/$TARGET
}

# recursive interactive search and cd
function cdpr() {
  local ROOT=`current_or $1`
  local TARGET=`find.py $ROOT -d -r | percol --match-method regex`
  cd $ROOT/$TARGET
}

# chaining cdp
function cdpc() {
  cdp
  x=`find . -type d -depth 1`
  if [ $#x -ne 0 ]; then
    cdpc
  fi
}
