module Executors(
get,
help
) where


import Lib


vim  = ["source "]
py   = ["!python ", "Reload "]
hs   = ["!runhaskell ", "Reload "]
html = ["Reload "]
js   = ["Reload "]
css  = ["Reload "]
php  = ["!php ", "Reload "]
sh   = ["!sh "]


get :: Int -> String -> Maybe String
get n "vim"  = vim  !!! n
get n "py"   = py   !!! n
get n "hs"   = hs   !!! n
get n "html" = html !!! n
get n "js"   = js   !!! n
get n "css"  = css  !!! n
get n "php"  = php  !!! n
get n "sh"   = sh   !!! n
get _ _      = Nothing


help :: Int -> String -> Maybe String
help n "vim"  = Just $ init $ unlines $ helpLines "Executor : " n vim
help n "py"   = Just $ init $ unlines $ helpLines "Executor : " n py
help n "hs"   = Just $ init $ unlines $ helpLines "Executor : " n hs
help n "html" = Just $ init $ unlines $ helpLines "Executor : " n html
help n "js"   = Just $ init $ unlines $ helpLines "Executor : " n js
help n "css"  = Just $ init $ unlines $ helpLines "Executor : " n css
help n "php"  = Just $ init $ unlines $ helpLines "Executor : " n php
help n "sh"   = Just $ init $ unlines $ helpLines "Executor : " n sh
help _ _      = Nothing


main = do
    print $ get 0 "php"
    print $ get 5 "php"
    print $ get 0 "invalid"
    print $ help 0 "php"
    print $ help 5 "php"
    print $ help 0 "invalid"
