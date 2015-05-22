module Executors(
get,
help
) where


php = [
    "!php ",
    "R"
    ]

hs = [
    "!runhaskell "
    ]


pre mode n | n == mode = ("* executor " ++)
pre mode n | n /= mode = ("  executor " ++)

helpLines mode definitions = zipWith prefix [0..] definitions
    where prefix = pre mode


get mode "php" = php !! mode
get mode "hs"  = hs  !! mode

help mode "php" = unlines $ helpLines mode php
help mode "hs"  = unlines $ helpLines mode hs

main = do
    putStrLn $ get 0 "php"
    putStrLn $ help 0 "php"
    putStrLn $ help 0 "hs"
