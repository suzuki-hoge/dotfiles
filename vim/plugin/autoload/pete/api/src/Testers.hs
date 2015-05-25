module Testers(
get,
help
) where


import Control.Applicative

import Lib


vim  = [""]
py   = [""]
hs   = ["!runhaskell "]
html = [""]
js   = [""]
css  = [""]
php  = ["!phpunit "]
sh   = [""]


get :: Int -> String -> String -> Maybe String
get n text "vim"  = (++ text) <$> vim  !!! n
get n text "py"   = (++ text) <$> py   !!! n
get n text "hs"   = (++ text) <$> hs   !!! n
get n text "html" = (++ text) <$> html !!! n
get n text "js"   = (++ text) <$> js   !!! n
get n text "css"  = (++ text) <$> css  !!! n
get n text "php"  = (++ text) <$> php  !!! n
get n text "sh"   = (++ text) <$> sh   !!! n
get _ _    _      = Nothing


help :: Int -> String -> String -> Maybe String
help n text "vim"  = Just $ init $ unlines $ helpLines "Tester   : " n text vim
help n text "py"   = Just $ init $ unlines $ helpLines "Tester   : " n text py
help n text "hs"   = Just $ init $ unlines $ helpLines "Tester   : " n text hs
help n text "html" = Just $ init $ unlines $ helpLines "Tester   : " n text html
help n text "js"   = Just $ init $ unlines $ helpLines "Tester   : " n text js
help n text "css"  = Just $ init $ unlines $ helpLines "Tester   : " n text css
help n text "php"  = Just $ init $ unlines $ helpLines "Tester   : " n text php
help n text "sh"   = Just $ init $ unlines $ helpLines "Tester   : " n text sh
help _ _    _      = Nothing


main = do
    print $ get 0 "$pete" "php"
    print $ get 5 "$pete" "php"
    print $ get 0 "$pete" "invalid"
    print $ help 0 "$pete" "php"
    print $ help 0 "$pete" "invalid"
