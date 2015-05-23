module Testers(
get,
help
) where


import Help


php = ["!phpunit "]
hs  = ["!runhaskell "]


get :: Int -> String -> String
get n "php" = php !! n
get n "hs"  = hs  !! n


help :: Int -> String -> String
help n "php" = unlines $ helpLines "tester " n php
help n "hs"  = unlines $ helpLines "tester " n hs


main = do
    putStrLn $ get 0 "php"
    putStrLn $ help 0 "php"
    putStrLn $ help 0 "hs"
