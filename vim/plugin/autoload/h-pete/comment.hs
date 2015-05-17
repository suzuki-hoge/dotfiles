import Text.Regex
import Text.Regex.Posix

is :: (String, String) -> String -> Bool
is (head, tail) line = line =~ ("^[ |\t]*" ++ head ++ ".*" ++ tail ++ "[ |\t]*$")

commentize :: (String, String) -> String -> String
commentize (head, tail) line = head ++ line ++ tail

decommentize :: (String, String) -> String -> String
decommentize (head, tail) line
    | is (head, tail) line == True  = subRegex (mkRegex $ "^([ |\t]*)" ++ head ++ "|" ++ tail ++ "([ |\t]*)$") line "\\1\\2"
    | is (head, tail) line == False = line

switch :: (String, String) -> String -> String
switch (head, tail) line
    | is (head, tail) line == True  = decommentize (head, tail) line
    | is (head, tail) line == False = commentize (head, tail) line

data Pete = Pete { comment :: (String, String) } deriving (Show)
haskell = Pete { comment = ("// ", " //") }

createPete extension
    | extension == "hs" = haskell

dispath :: Pete -> String -> String -> String
dispath pete command line
    | command == "commentize"   = commentize   comment' line
    | command == "decommentize" = decommentize comment' line
    | command == "switch"       = switch       comment' line
    where comment' = comment pete

main = do
    let pete =  createPete "hs"
    let command = "commentize"
    let line = "hoge"

    print $ dispath pete command line
