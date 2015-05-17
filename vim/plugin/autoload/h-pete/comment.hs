import Text.Regex
import Text.Regex.Posix
import Control.Monad

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

data Pete = Pete { comment :: (String, String), extensions :: [String] } deriving (Show)
petes = [("Haskell", Pete { comment = ("// ", " //"),    extensions = ["hs"]   }),
         ("Html",    Pete { comment = ("<!-- ", " -->"), extensions = ["html"] })]

dispath :: Maybe Pete -> String -> String -> String
dispath (Just pete) command line
    | command == "commentize"   = commentize   comment' line
    | command == "decommentize" = decommentize comment' line
    | command == "switch"       = switch       comment' line
    where comment' = comment pete
dispath Nothing _ _ = "--- pete failure ---"

find []         _                                         = Nothing
find ((_,x):xs) extension | elem extension (extensions x) = Just x
find ((_,x):xs) extension | otherwise                     = find xs extension

isIn extension pete = elem extension $ extensions pete

main = do
    let pete = find petes "html"
    let command = "commentize"
    let line = "hoge"

    print $ dispath pete command line
