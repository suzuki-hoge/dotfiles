module Edit(
get,
help
) where

import Text.Printf

get text ext = printf "tabedit %s.%s" text ext :: String

help = get

main = do
    putStrLn $ get "pete" "php"
    putStrLn $ help "pete" "php"
