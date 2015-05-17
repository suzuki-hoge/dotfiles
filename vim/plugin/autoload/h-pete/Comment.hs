module Comment
(commentize
, decommentize
, switch)
where

import Text.Regex
import Text.Regex.Posix

is :: (String, String) -> String -> Bool
is (head, tail) text = text =~ ("^[ |\t]*" ++ head ++ ".*" ++ tail ++ "[ |\t]*$")

commentize :: (String, String) -> String -> String
commentize (head, tail) text = head ++ text ++ tail

decommentize :: (String, String) -> String -> String
decommentize (head, tail) text
    | is (head, tail) text == True  = subRegex (mkRegex $ "^([ |\t]*)" ++ head ++ "|" ++ tail ++ "([ |\t]*)$") text "\\1\\2"
    | is (head, tail) text == False = text

switch :: (String, String) -> String -> String
switch (head, tail) text
    | is (head, tail) text == True  = decommentize (head, tail) text
    | is (head, tail) text == False = commentize (head, tail) text
