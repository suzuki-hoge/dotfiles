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


toInt c = ord c - 48


create str = Mode {
    execute = toInt $ str !! 0,
    tool    = toInt $ str !! 1,
    debug   = toInt $ str !! 2
}
