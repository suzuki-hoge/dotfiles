module Executors(
get,
help
) where


import Lib


php = ["!php ", "Reload"]
hs  = ["!runhaskell "]


get :: Int -> String -> Maybe String
get n "php" = php !!! n
get n "hs"  = hs  !!! n
get _ _     = Nothing


help :: Int -> String -> Maybe String
help n "php" = Just $ init $ unlines $ helpLines "Executor : " n php
help n "hs"  = Just $ init $ unlines $ helpLines "Executor : " n hs
help _ _     = Nothing


main = do
    print $ get 0 "php"
    print $ get 5 "php"
    print $ get 0 "invalid"
    print $ help 0 "php"
    print $ help 5 "php"
    print $ help 0 "invalid"
