module Executors(
get,
) where


php = [
    "!php ",
    "R"
    ]

hs = [
    "!runhaskell"
    ]

get mode "php" = php !! mode
get mode "hs"  = hs  !! mode

main = do
    putStrLn $ get 0 "php"
