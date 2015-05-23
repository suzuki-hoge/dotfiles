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
help ext = init $ init $ replace "\n" ", " $ get ext


main = do
    putStrLn $ get "php"
    putStrLn $ help "php"
