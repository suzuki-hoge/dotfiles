module Makers(
get,
help
) where


import Lib


php = ["!php "]
hs  = ["!ghc --make "]


get :: Int -> String -> Maybe String
get n "php" = php !!! n
get n "hs"  = hs  !!! n
get _ _     = Nothing


help :: Int -> String -> Maybe String
help n "php" = Just $ init $ unlines $ helpLines "Maker    : " n php
help n "hs"  = Just $ init $ unlines $ helpLines "Maker    : " n hs
help _ _     = Nothing


main = do
    print $ get 0 "hs"
    print $ get 5 "hs"
    print $ help 0 "php"
    print $ help 0 "invalid"
