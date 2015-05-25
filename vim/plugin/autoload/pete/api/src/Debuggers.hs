module Debuggers(
get,
help
) where


import Text.Printf
import Data.String.Utils

import Lib


vim  = ["echo %s"]
py   = ["print %s"]
hs   = ["print %s", "putStrLn %s"]
html = [""]
js   = ["console.log(%s);"]
css  = [""]
php  = ["echo '<pre>';\nvar_dump($%s);\nexit;", "print_r($%s);"]
sh   = ["echo %s"]


expand :: String -> String -> String
expand text definition = replace "\n" " " expand'
    where expand' = printf definition text :: String


pre' :: Int -> Int -> String -> String
pre' n m | n == m = ("* Debugger : " ++)
pre' n m | n /= m = ("  Debugger : " ++)


helpLines' :: Int -> String -> [String] -> [String]
helpLines' n text definitions = zipWith prefix [0..] lines
    where prefix = pre' n
          lines  = map (expand text) definitions


format :: Maybe String -> String -> Maybe String
format (Just definition) text = Just $ printf definition text
format Nothing           _    = Nothing


get :: Int -> String -> String -> Maybe String
get n text "vim"  = format (vim  !!! n) text
get n text "py"   = format (py   !!! n) text
get n text "hs"   = format (hs   !!! n) text
get n text "html" = format (html !!! n) text
get n text "js"   = format (js   !!! n) text
get n text "css"  = format (css  !!! n) text
get n text "php"  = format (php  !!! n) text
get n text "sh"   = format (sh   !!! n) text
get _ _    _      = Nothing


help :: Int -> String -> String -> Maybe String
help n text "vim"  = Just $ unlines $ helpLines' n text vim
help n text "py"   = Just $ unlines $ helpLines' n text py
help n text "hs"   = Just $ unlines $ helpLines' n text hs
help n text "html" = Just $ unlines $ helpLines' n text html
help n text "js"   = Just $ unlines $ helpLines' n text js
help n text "css"  = Just $ unlines $ helpLines' n text css
help n text "php"  = Just $ unlines $ helpLines' n text php
help n text "sh"   = Just $ unlines $ helpLines' n text sh
help _ _    _       = Nothing


main = do
    print $ get 0 "pete" "hs"
    print $ get 5 "pete" "hs"
    print $ get 0 "pete" "invalid"
    print $ help 0 "pete" "hs"
    print $ help 0 "pete" "invalid"
