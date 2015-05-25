module Makers(
get,
help
) where


import Lib


vim  = [""]
py   = [""]
hs   = ["!ghc --make "]
html = [""]
js   = [""]
css  = [""]
php  = [""]
sh   = [""]


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
help n "vim"  = Just $ init $ unlines $ helpLines "Maker    : " n vim
help n "py"   = Just $ init $ unlines $ helpLines "Maker    : " n py
help n "hs"   = Just $ init $ unlines $ helpLines "Maker    : " n hs
help n "html" = Just $ init $ unlines $ helpLines "Maker    : " n html
help n "js"   = Just $ init $ unlines $ helpLines "Maker    : " n js
help n "css"  = Just $ init $ unlines $ helpLines "Maker    : " n css
help n "php"  = Just $ init $ unlines $ helpLines "Maker    : " n php
help n "sh"   = Just $ init $ unlines $ helpLines "Maker    : " n sh
help _ _      = Nothing


main = do
    print $ get 0 "hs"
    print $ get 5 "hs"
    print $ help 0 "php"
    print $ help 0 "invalid"
