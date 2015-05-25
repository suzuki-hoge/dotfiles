module Lib
(pre,
helpLines,
(!!!)
) where


pre :: String -> Int -> Int -> String -> String
pre label n i | n == i = \s -> "* " ++ label ++ s
pre label n i | n /= i = \s -> "  " ++ label ++ s


helpLines :: String -> Int -> [String] -> [String]
helpLines label n definitions = zipWith prefix [0..] definitions
    where prefix = pre label n


(!!!) list n | n <            0 = Nothing
(!!!) list n | n >= length list = Nothing
(!!!) list n                    = Just $ list !! n
