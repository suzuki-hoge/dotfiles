module Mode
(Mode(..),
create
) where


import Data.Char


data Mode = Mode {
    execute :: Int,
    tool    :: Int,
    debug   :: Int
} deriving (Show)


toInt :: Char -> Int
toInt c = ord c - 48


create :: String -> Mode
create str = Mode {
    execute = toInt $ str !! 0,
    tool    = toInt $ str !! 1,
    debug   = toInt $ str !! 2
}
