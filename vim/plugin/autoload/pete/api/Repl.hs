module Repl(
get,
help
) where


get :: String -> String
get "php" = ""
get "hs"  = "!ghci"


help :: String -> String
help = get


main = do
    putStrLn $ get "hs"
    putStrLn $ help "hs"
