module System(
find,
mkFindOptions,
awk,
mkAwkOptions
) where


import System.Process

import Data


type Black = String
type Options = [String]


find :: Options -> IO String
find options = readProcess "find" options []


mkFindOptions :: Path -> [Black] -> Options
mkFindOptions path blackNames = [path] ++ (blacks blackNames) ++ ["-ls"]


awk :: Options -> String -> IO String
awk options stdin = readProcess "awk" options stdin

mkAwkOptions :: Options
mkAwkOptions = ["{ print $3,$11 }"]


blacks :: [Black] -> [String]
blacks []     = []
blacks [x]    = black x
blacks (x:xs) = black x ++ blacks xs


black :: Black -> [String]
black name = ["-name", name, "-prune", "-or"]
