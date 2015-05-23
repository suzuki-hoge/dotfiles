module Debuggers(
get,
help
) where


import Text.Printf
import Data.String.Utils


php = [
    "echo '<pre>';\nvar_dump($%s);\nexit;",
    "print_r($%s);"
    ]


hs = [
    "print %s"
    ]


expand definition = replace "\n" " " expand'
    where expand' = printf definition "pete" :: String


pre :: Int -> Int -> String -> String
pre n m | n == m = ("* debugger " ++)
pre n m | n /= m = ("  debugger " ++)


helpLines :: Int -> [String] -> [String]
helpLines n definitions = zipWith prefix [0..] lines
    where prefix = pre n
          lines  = map expand definitions


get :: Int -> String -> String -> String
get n text "php" = printf (php !! n) text
get n text "hs"  = printf (hs  !! n) text


help :: Int -> String -> String
help n "php" = unlines $ helpLines n php
help n "hs"  = unlines $ helpLines n hs


main = do
    putStrLn $ get 0 "pete" "hs"
    putStrLn $ help 0 "hs"
