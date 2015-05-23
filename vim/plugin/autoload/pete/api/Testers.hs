module Testers(
get,
help
) where


php = [
    "!phpunit "
    ]


hs = [
    "!runhaskell "
    ]


pre :: Int -> Int -> String -> String
pre n m | n == m = ("* tester " ++)
pre n m | n /= m = ("  tester " ++)


helpLines :: Int -> [String] -> [String]
helpLines n definitions = zipWith prefix [0..] definitions
    where prefix = pre n


get :: Int -> String -> String
get n "php" = php !! n
get n "hs"  = hs  !! n


help :: Int -> String -> String
help n "php" = unlines $ helpLines n php
help n "hs"  = unlines $ helpLines n hs


main = do
    putStrLn $ get 0 "php"
    putStrLn $ help 0 "php"
    putStrLn $ help 0 "hs"
