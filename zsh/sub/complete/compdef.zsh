# fab
compdef f_fab_complete fab
function f_fab_tasks {
  in_header=1
  tasks=()
  IFS_BK=$IFS
  IFS=$'\n'

  fabfile=`echo $BUFFER | awk '{for(i=1; i <= NF; i++) if($i == "-f") print $(i + 1) }'`

  if [ -n "$fabfile" ]; then list=`fab -f $fabfile --list`; else list=`fab --list`; fi

  while read line
  do
    if [[ $line = '' ]] ;then
      continue
    fi
    if [[ $in_header -ne 1 ]] ;then
      tasks+=(`echo $line | awk '{printf("%s", $1); $1=""; if ($0 != "") printf("[%s]", $0)}' | sed -e 's/\[ /\[/g'`)
    fi
    if [[ $line =~ 'Available commands:' ]]; then
      in_header=0
    fi
  done <<END
$list
END

  _values 'tasks' $tasks
  IFS=$IFS_BK
}

function f_fab_complete {
  _arguments \
    '(- *)'{-l,--list}'[print list of possible commands and exit]' \
    '(-f --file)'{-f,--file}"[python module file to import, e.g. '../other.py']:fabric file:_files" \
    '*:tasks:f_fab_tasks'
}
