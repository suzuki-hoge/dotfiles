module Executors(
get,
help
) where


import Help


php = ["!php ", "Reload"]
hs  = ["!runhaskell "]


get :: Int -> String -> String
get n "php" = php !! n
get n "hs"  = hs  !! n


help :: Int -> String -> String
help n "php" = unlines $ helpLines "executor " n php
help n "hs"  = unlines $ helpLines "executor " n hs


main = do
    putStrLn $ get 0 "php"
    putStrLn $ help 0 "php"
    putStrLn $ help 0 "hs"
