#
# main
#
function prompt-main {
  # left prompt
  PROMPT=$'
%d
`mark` '
  
  # right prompt
  RPROMPT=$'`git-info`'

  function mark {
    if [ `uname -m` = 'arm64' ]; then
      echo ''
    else
      echo '>'
    fi
  }
  
  setopt prompt_subst

  autoload -U colors; colors
  
  function git-info {
    local prefix branchname suffix
  
    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
      return
    fi
  
    branchname=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  
    if [[ -z $branchname ]]; then
      return
    fi
  
    prefix=`get-color`
    suffix='%{'${reset_color}'%}'
  
    echo ${prefix}${branchname}${suffix}
  }
  
  function get-color {
    local color
    output=`git status --short 2> /dev/null`
  
    # clean
    if [ -z "$output" ]; then
      color='%{'${fg[green]}'%}'
  
    # untracked
    elif [[ $output =~ "[\n]?\?\? " ]]; then
      color='%{'${fg[yellow]}'%}'
  
    # modified
    elif [[ $output =~ "[\n]? M " ]]; then
      color='%{'${fg[red]}'%}'
  
    # added to commit
    else
      color='%{'${fg[cyan]}'%}'
    fi
  
    echo ${color}
  }
}

#
# simple
#
function prompt-simple {
  # left prompt
  PROMPT="
$ "
  
  # right prompt
  RPROMPT=""
}

#
# switcher
#
function pswitch {
  if [ ${CURRENT_PROMPT:-simple} = "simple" ]; then
      prompt-main
      CURRENT_PROMPT=main
    else
      prompt-simple
      CURRENT_PROMPT=simple
  fi
}

pswitch

