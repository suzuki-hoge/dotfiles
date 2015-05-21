module Repl(
get,
) where


get "php" = ""
get "hs"  = "!ghci"

main = do
    putStrLn $ get "hs"
