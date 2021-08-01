function al() {
  item=`python ./action-parser.py items | percol --match-method regex | xargs echo`

  BK=$IFS
  IFS=$'\n'

  for item in `python ./action-parser.py commands $item`
  do
    val=`echo $item | jq -r .val | sed 's/<CR>/\'$'\n/'`
    act=`echo $item | jq -r .act`

    case "$act" in
      "copy" )
        echo "$val" | pbcopy
        ;;
      "exec" )
        eval $val
        ;;
    esac
  done

  IFS=$BK
}

