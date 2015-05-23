module Options(
get,
help
) where


import Data.String.Utils


php = ["set expandtab", "set nowrap"]
hs  = ["set expandtab"]


get :: String -> String
get "php" = unlines php
get "hs"  = unlines hs


help :: String -> String
help ext = "  Options  : " ++ (init $ init $ replace "\n" ", " $ get ext)


main = do
    print $ get "php"
    print $ help "php"
