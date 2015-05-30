module Mode
(Mode(..),
createMode
) where


import Data.Char


data Mode = Mode {
    executeMode :: Int,
    toolMode    :: Int,
    debugMode   :: Int
} deriving (Show)


toInt c = ord c - 48


createMode str = Mode {
    executeMode = toInt $ str !! 0,
    toolMode    = toInt $ str !! 1,
    debugMode   = toInt $ str !! 2
}
