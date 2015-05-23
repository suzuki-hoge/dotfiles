module Executors(
get,
help
) where


import Lib


php = ["!php ", "Reload"]
hs  = ["!runhaskell "]


get :: Int -> String -> String
get n "php" = php !! n
get n "hs"  = hs  !! n


help :: Int -> String -> String
help n "php" = init $ unlines $ helpLines "Executor : " n php
help n "hs"  = init $ unlines $ helpLines "Executor : " n hs


main = do
    print $ get 0 "php"
    print $ help 0 "php"
    print $ help 0 "hs"
