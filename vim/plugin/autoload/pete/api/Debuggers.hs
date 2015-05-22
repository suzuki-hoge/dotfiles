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


pre mode n | n == mode = ("* debugger " ++)
pre mode n | n /= mode = ("  debugger " ++)


helpLines mode definitions = zipWith prefix [0..] lines
    where prefix = pre mode
          lines  = map expand definitions


get mode text "php" = printf (php !! mode) text
get mode text "hs"  = printf (hs  !! mode) text

help mode "php" = unlines $ helpLines mode php
help mode "hs"  = unlines $ helpLines mode hs

main = do
    putStrLn $ get 0 "pete" "hs"
    putStrLn $ help 0 "hs"
