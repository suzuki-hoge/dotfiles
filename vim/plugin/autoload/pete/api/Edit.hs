module Edit(
get,
help
) where


import Text.Printf
import Control.Applicative


get :: String -> String -> Maybe String
get text ext = Just (printf "tabedit %s.%s" text ext :: String)


help :: String -> String -> Maybe String
help text ext = ("  Edit     : " ++) <$> get text ext


main = do
    print $ get "pete" "php"
    print $ help "pete" "php"
