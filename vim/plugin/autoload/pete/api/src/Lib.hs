module Lib
(pre,
helpLines,
(!!!)
) where


pre :: String -> Int -> String -> Int -> String -> String
pre label n text i | n == i = \s -> "* " ++ label ++ s ++ text
pre label n text i | n /= i = \s -> "  " ++ label ++ s ++ text


helpLines :: String -> Int -> String -> [String] -> [String]
helpLines label n text definitions = zipWith prefix [0..] definitions
    where prefix = pre label n text


(!!!) list n | n <            0 = Nothing
(!!!) list n | n >= length list = Nothing
(!!!) list n                    = Just $ list !! n
