module Comment(
commentize,
decommentize,
switch,
help
) where


import Text.Regex
import Text.Regex.Posix
import Control.Applicative


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


php  = ("// ", "")
hs   = ("-- ", "")
html = ("<!-- ", " -->")


commentize :: String -> String -> Maybe String
commentize text "php"  = Just $ commentize' text php
commentize text "hs"   = Just $ commentize' text hs
commentize text "html" = Just $ commentize' text html
commentize _    _      = Nothing


decommentize :: String -> String -> Maybe String
decommentize text "php"  = Just $ decommentize' text php
decommentize text "hs"   = Just $ decommentize' text hs
decommentize text "html" = Just $ decommentize' text html
decommentize _    _      = Nothing


switch :: String -> String -> Maybe String
switch text "php"  = Just $ switch' text php
switch text "hs"   = Just $ switch' text hs
switch text "html" = Just $ switch' text html
switch _    _      = Nothing


help :: String -> String -> Maybe String
help text ext = ("  Comment  : " ++) <$> commentize text ext 


main = do
    print $ commentize "pete" "php"
    print $ commentize "pete" "invalid"
    print $ decommentize "-- pete" "hs"

    print $ help "pete" "php"
    print $ help "pete" "invalid"
