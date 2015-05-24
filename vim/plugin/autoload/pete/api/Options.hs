module Options(
get,
help
) where


import Data.String.Utils
import Control.Applicative


vim  = [""]
py   = [""]
hs   = ["set expandtab"]
html = [""]
js   = [""]
css  = [""]
php  = [""]
sh   = [""]


get :: String -> Maybe String
get "vim"  = Just $ unlines vim
get "py"   = Just $ unlines py
get "hs"   = Just $ unlines hs
get "html" = Just $ unlines html
get "js"   = Just $ unlines js
get "css"  = Just $ unlines css
get "php"  = Just $ unlines php
get "sh"   = Just $ unlines sh
get _      = Nothing


help :: String -> Maybe String
help ext = ("  Options  : " ++) <$> init <$> init <$> replaced
    where replaced = replace "\n" ", " <$> get ext


main = do
    print $ get "php"
    print $ get "invalid"
    print $ help "php"
    print $ help "invalid"
