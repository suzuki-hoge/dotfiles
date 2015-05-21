module Comment(
commentize,
decommentize,
switch,
help
) where


import Text.Regex
import Text.Regex.Posix


is' text (head, tail) = text =~ ("^[ |\t]*" ++ head ++ ".*" ++ tail ++ "[ |\t]*$")

commentize' text (head, tail) = head ++ text ++ tail

decommentize' text (head, tail)
    | is' text (head, tail) == True  = subRegex (mkRegex $ "^([ |\t]*)" ++ head ++ "|" ++ tail ++ "([ |\t]*)$") text "\\1\\2"
    | is' text (head, tail) == False = text

switch' text comment
    | is' text comment == True  = decommentize' text comment
    | is' text comment == False = commentize'   text comment


php = ("// ", "")
hs  = ("-- ", "")

commentize text "php" = commentize' text php
commentize text "hs"  = commentize' text hs

decommentize text "php" = decommentize' text php
decommentize text "hs"  = decommentize' text hs

switch text "php" = switch' text php
switch text "hs"  = switch' text hs

help = commentize

main = do
    putStrLn $ commentize "pete" "php"
    putStrLn $ decommentize "-- pete" "hs"

    putStrLn $ help "pete" "php"
