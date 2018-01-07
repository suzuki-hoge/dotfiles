# left prompt
PROMPT="
%d
> "

# right prompt
RPROMPT=$'`git_info`'

setopt prompt_subst
autoload -U colors; colors

# branch name and colored status
function git_info {
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
