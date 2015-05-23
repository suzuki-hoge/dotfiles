module Testers(
get,
help
) where


import Lib


php = ["!phpunit "]
hs  = ["!runhaskell "]


get :: Int -> String -> String
get n "php" = php !! n
get n "hs"  = hs  !! n


help :: Int -> String -> String
help n "php" = init $ unlines $ helpLines "Tester   : " n php
help n "hs"  = init $ unlines $ helpLines "Tester   : " n hs


main = do
    print $ get 0 "php"
    print $ help 0 "php"
    print $ help 0 "hs"
