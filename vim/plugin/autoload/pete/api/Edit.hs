module Edit(
get,
help
) where

import Text.Printf

get ext text = printf "tabedit %s.%s" text ext :: String

help = get

main = do
    putStrLn $ get "php" "pete"
    putStrLn $ help "php" "pete"
