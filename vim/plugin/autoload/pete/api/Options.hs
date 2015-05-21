module Options(
get,
) where


php = [
    "set expandtab",
    "set nowrap"
    ]

hs = [
    "set expandtab"
    ]

get "php" = unlines php
get "hs"  = unlines hs

main = do
    putStrLn $ get "php"
