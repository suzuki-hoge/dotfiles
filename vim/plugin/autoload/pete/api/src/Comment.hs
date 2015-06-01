module Comment(
commentize,
decommentize,
switch
) where


import Text.Regex
import Text.Regex.Posix
import Text.Printf

import Definition.Data


is :: String -> Comment -> Bool
is text (head, tail) = text =~ ("^[ |\t]*" ++ head ++ ".*" ++ tail ++ "[ |\t]*$")


commentize :: String -> Comment -> String
commentize text (head, tail) = head ++ text ++ tail


decommentize :: String -> Comment -> String
decommentize text comment
    |      is text comment  = subRegex (mkRegex' comment) text "\\1\\2"
    | not (is text comment) = text


mkRegex' :: Comment -> Regex
mkRegex' (head, tail) = mkRegex reg
    where reg = printf "^([ |\t]*)%s|%s([ |\t]*)$" head tail :: String


switch :: String -> Comment -> String
switch text comment
    |      is text comment  = decommentize text comment
    | not (is text comment) = commentize   text comment
