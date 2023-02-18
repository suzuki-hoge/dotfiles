# interactive search and copy to clipboard
function hiscp() {
  local HISTORIES="`history -n 1 | awk '!a[$0]++' | tail -r | bf`"
  echo $HISTORIES C
}
