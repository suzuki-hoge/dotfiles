module Repl(
get,
help
) where


get :: String -> String
get "php" = ""
get "hs"  = "!ghci"


help :: String -> String
help ext = "  Repl     : " ++ get ext


main = do
    print $ get "hs"
    print $ help "hs"
