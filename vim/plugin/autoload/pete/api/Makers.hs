module Makers(
get,
help
) where


import Help


php = ["!php "]
hs  = ["!ghc --make "]


get :: Int -> String -> String
get n "php" = php !! n
get n "hs"  = hs  !! n


help :: Int -> String -> String
help n "php" = unlines $ helpLines "maker " n php
help n "hs"  = unlines $ helpLines "maker " n hs


main = do
    putStrLn $ get 0 "php"
    putStrLn $ help 0 "php"
    putStrLn $ help 0 "hs"
