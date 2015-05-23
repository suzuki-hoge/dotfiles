module Comment(
commentize,
decommentize,
switch,
help
) where


import Text.Regex
import Text.Regex.Posix


is' :: String -> (String, String) -> Bool
is' text (head, tail) = text =~ ("^[ |\t]*" ++ head ++ ".*" ++ tail ++ "[ |\t]*$")


commentize' :: String -> (String, String) -> String
commentize' text (head, tail) = head ++ text ++ tail


decommentize' :: String -> (String, String) -> String
decommentize' text (head, tail)
    | is' text (head, tail) == True  = subRegex (mkRegex $ "^([ |\t]*)" ++ head ++ "|" ++ tail ++ "([ |\t]*)$") text "\\1\\2"
    | is' text (head, tail) == False = text


switch' :: String -> (String, String) -> String
switch' text comment
    | is' text comment == True  = decommentize' text comment
    | is' text comment == False = commentize'   text comment


php = ("// ", "")
hs  = ("-- ", "")


commentize :: String -> String -> String
commentize text "php" = commentize' text php
commentize text "hs"  = commentize' text hs


decommentize :: String -> String -> String
decommentize text "php" = decommentize' text php
decommentize text "hs"  = decommentize' text hs


switch :: String -> String -> String
switch text "php" = switch' text php
switch text "hs"  = switch' text hs


help :: String -> String -> String
help text ext = "  Comment  : " ++ commentize text ext 


main = do
    print $ commentize "pete" "php"
    print $ decommentize "-- pete" "hs"

    print $ help "pete" "php"
