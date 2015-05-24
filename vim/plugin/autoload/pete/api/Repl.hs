module Repl(
get,
help
) where


import Control.Applicative


get :: String -> Maybe String
get "php" = Just ""
get "hs"  = Just "!ghci"
get _     = Nothing


help :: String -> Maybe String
help ext = ("  Repl     : " ++) <$> get ext


main = do
    print $ get "hs"
    print $ get "invalid"
    print $ help "hs"
    print $ help "invalid"
