function al() {
  item=`yq -r ".[] | .item" ~/.action-launcher.yaml | percol --match-method regex | xargs echo`

  BK=$IFS
  IFS=$'\n'

  for item in `yq -c ".[] | select(.item == \"$item\") | .commands[]" ~/.action-launcher.yaml`
  do
    val=`echo $item | yq -r .val | sed 's/<CR>/\'$'\n/'`
    act=`echo $item | yq -r .act`

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

