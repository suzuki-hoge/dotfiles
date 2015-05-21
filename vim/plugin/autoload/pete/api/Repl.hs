module Repl(
get,
help
) where


get "php" = ""
get "hs"  = "!ghci"

help = get

main = do
    putStrLn $ get "hs"
    putStrLn $ help "hs"
