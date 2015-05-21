module Testers(
get,
) where


php = [
    "!phpunit "
    ]

hs = [
    "!runhaskell"
    ]

get mode "php" = php !! mode
get mode "hs"  = hs  !! mode

main = do
    putStrLn $ get 0 "php"
