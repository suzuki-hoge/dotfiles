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


vim  = ("\" ", "")
py   = ("# ", "")
hs   = ("-- ", "")
html = ("<!-- ", " -->")
js   = ("// ", "")
css  = ("// ", "")
php  = ("// ", "")
sh   = ("", "")


commentize :: String -> String -> Maybe String
commentize text "vim"  = Just $ commentize' text vim
commentize text "py"   = Just $ commentize' text py
commentize text "hs"   = Just $ commentize' text hs
commentize text "html" = Just $ commentize' text html
commentize text "js"   = Just $ commentize' text js
commentize text "css"  = Just $ commentize' text css
commentize text "php"  = Just $ commentize' text php
commentize text "sh"   = Just $ commentize' text sh
commentize _    _      = Nothing


decommentize :: String -> String -> Maybe String
decommentize text "vim"  = Just $ decommentize' text vim
decommentize text "py"   = Just $ decommentize' text py
decommentize text "hs"   = Just $ decommentize' text hs
decommentize text "html" = Just $ decommentize' text html
decommentize text "js"   = Just $ decommentize' text js
decommentize text "css"  = Just $ decommentize' text css
decommentize text "php"  = Just $ decommentize' text php
decommentize text "sh"   = Just $ decommentize' text sh
decommentize _    _      = Nothing


switch :: String -> String -> Maybe String
switch text "vim"  = Just $ switch' text vim
switch text "py"   = Just $ switch' text py
switch text "hs"   = Just $ switch' text hs
switch text "html" = Just $ switch' text html
switch text "js"   = Just $ switch' text js
switch text "css"  = Just $ switch' text css
switch text "php"  = Just $ switch' text php
switch text "sh"   = Just $ switch' text sh
switch _    _      = Nothing


help :: String -> String -> Maybe String
help text ext = ("  Comment  : " ++) <$> commentize text ext 


main = do
    print $ commentize "pete" "php"
    print $ commentize "pete" "invalid"
    print $ decommentize "-- pete" "hs"

    print $ help "pete" "php"
    print $ help "pete" "invalid"
