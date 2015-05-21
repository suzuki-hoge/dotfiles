module Options(
get,
help
) where

import Data.String.Utils


php = [
    "set expandtab",
    "set nowrap"
    ]

hs = [
    "set expandtab"
    ]

get "php" = unlines php
get "hs"  = unlines hs

help ext = init $ init $ replace "\n" ", " $ get ext

main = do
    putStrLn $ get "php"
    putStrLn $ help "php"
