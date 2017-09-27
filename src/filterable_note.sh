dir=$(cd $(dirname $0); pwd)
script_path=${dir}/filterable_note.py

echo $script_path

book_name=$1


if [ "$#" = 1 ]; then
    note_name=`python $script_path $1 | percol`
else
    note_name=$2
fi


selected=`python $script_path $book_name $note_name | percol`

IFS='|'
set -- $selected
key=`echo $1 | tr -d ' '`


value=`python $script_path $book_name $note_name $key`

echo $value
