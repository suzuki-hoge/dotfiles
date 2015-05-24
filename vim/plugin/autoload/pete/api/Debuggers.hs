module Debuggers(
get,
help
) where


import Text.Printf
import Data.String.Utils

import Lib


php = ["echo '<pre>';\nvar_dump($%s);\nexit;", "print_r($%s);"]
hs  = ["print %s"]


expand definition = replace "\n" " " expand'
    where expand' = printf definition "pete" :: String


pre' :: Int -> Int -> String -> String
pre' n m | n == m = ("* Debugger : " ++)
pre' n m | n /= m = ("  Debugger : " ++)


helpLines' :: Int -> [String] -> [String]
helpLines' n definitions = zipWith prefix [0..] lines
    where prefix = pre' n
          lines  = map expand definitions


format :: Maybe String -> String -> Maybe String
format (Just definition) text = Just $ printf definition text
format Nothing           _    = Nothing


get :: Int -> String -> String -> Maybe String
get n text "php" = format (php !!! n) text
get n text "hs"  = format (hs  !!! n) text
get _ _    _     = Nothing


help :: Int -> String -> Maybe String
help n "php" = Just $ unlines $ helpLines' n php
help n "hs"  = Just $ unlines $ helpLines' n hs
help _ _     = Nothing


main = do
    print $ get 0 "pete" "hs"
    print $ get 5 "pete" "hs"
    print $ get 0 "pete" "invalid"
    print $ help 0 "hs"
    print $ help 0 "invalid"
