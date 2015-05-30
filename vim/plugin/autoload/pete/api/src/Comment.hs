module Comment(
commentize,
decommentize,
switch
) where


import Text.Regex
import Text.Regex.Posix
import Text.Printf

import Data


is :: Comment -> String -> Bool
is (head, tail) text = text =~ ("^[ |\t]*" ++ head ++ ".*" ++ tail ++ "[ |\t]*$")


commentize :: Comment -> String -> String
commentize (head, tail) text = head ++ text ++ tail


decommentize :: Comment -> String -> String
decommentize comment text
    | is comment text == True  = subRegex (mkRegex' comment) text "\\1\\2"
    | is comment text == False = text


mkRegex' :: Comment -> Regex
mkRegex' (head, tail) = mkRegex reg
    where reg = printf "^([ |\t]*)%s|%s([ |\t]*)$" head tail :: String


switch :: Comment -> String -> String
switch comment text
    | is comment text == True  = decommentize comment text
    | is comment text == False = commentize   comment text
