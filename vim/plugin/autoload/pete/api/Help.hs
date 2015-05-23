module Help
(pre,
helpLines
) where


pre :: String -> Int -> Int -> String -> String
pre label n i | n == i = \s -> "* " ++ label ++ s
pre label n i | n /= i = \s -> "  " ++ label ++ s


helpLines :: String -> Int -> [String] -> [String]
helpLines label n definitions = zipWith prefix [0..] definitions
    where prefix = pre label n
