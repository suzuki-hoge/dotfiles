module Edit(
get,
help
) where


import Text.Printf


get :: String -> String -> String
get text ext = printf "tabedit %s.%s" text ext :: String


help :: String -> String -> String
help text ext = "  Edit     : " ++ get text ext


main = do
    print $ get "pete" "php"
    print $ help "pete" "php"
