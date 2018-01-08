bin=$(cd $(dirname $0); pwd)
script=${bin}/../src/filterable_book.py

book=$1


if [ "$#" = 1 ]; then
    note=`python $script $1 | percol`
else
    note=$2
fi


page=`python $script $book $note | percol`

IFS='|'
set -- $page
line_id=`echo $1 | sed 's/^ *//' | sed 's/ *$//'`


line_value=`python $script $book $note $line_id`

printf "$line_value"
