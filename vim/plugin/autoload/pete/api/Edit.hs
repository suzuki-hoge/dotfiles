module Edit(
get,
help
) where


import Text.Printf


get :: String -> String -> String
get text ext = printf "tabedit %s.%s" text ext :: String


help :: String -> String -> String
help = get


main = do
    putStrLn $ get "pete" "php"
    putStrLn $ help "pete" "php"
