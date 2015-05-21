module Makers(
get,
) where


php = [
    "!php "
    ]

hs = [
    "!ghc --make "
    ]

get mode "php" = php !! mode
get mode "hs"  = hs  !! mode

main = do
    putStrLn $ get 0 "php"
