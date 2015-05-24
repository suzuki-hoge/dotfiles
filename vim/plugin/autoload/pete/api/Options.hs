module Options(
get,
help
) where


import Data.String.Utils
import Control.Applicative


php = ["set expandtab", "set nowrap"]
hs  = ["set expandtab"]


get :: String -> Maybe String
get "php" = Just $ unlines php
get "hs"  = Just $ unlines hs
get _     = Nothing


help :: String -> Maybe String
help ext = ("  Options  : " ++) <$> init <$> init <$> replaced
    where replaced = replace "\n" ", " <$> get ext


main = do
    print $ get "php"
    print $ get "invalid"
    print $ help "php"
    print $ help "invalid"
