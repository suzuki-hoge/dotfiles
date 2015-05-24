module Repl(
get,
help
) where


import Control.Applicative


get :: String -> Maybe String
get "vim"  = Just ""
get "py"   = Just "!python"
get "hs"   = Just "!ghci"
get "html" = Just ""
get "js"   = Just ""
get "css"  = Just ""
get "php"  = Just ""
get "sh"   = Just ""
get _      = Nothing


help :: String -> Maybe String
help ext = ("  Repl     : " ++) <$> get ext


main = do
    print $ get "hs"
    print $ get "invalid"
    print $ help "hs"
    print $ help "invalid"
