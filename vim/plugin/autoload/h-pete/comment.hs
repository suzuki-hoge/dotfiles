import Text.Regex
import Text.Regex.Posix

-- data comment

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

main = do
    let comment = ("// ", " //")

    print $ is comment "// hoge //"

    print $ commentize comment "hoge"

    print $ decommentize comment "// hoge //"
    print $ decommentize comment "// hoge"

    print $ switch comment "hoge"
    print $ switch comment "// hoge //"
