module Edit(
get,
) where

import Text.Printf

get ext text = printf "tabedit %s.%s" text ext :: String

main = do
    putStrLn $ get "php" "pete"
