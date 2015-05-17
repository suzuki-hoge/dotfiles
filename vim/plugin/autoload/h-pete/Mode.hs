module Mode
(Mode(..),
createMode
) where

import Data.Char

data Mode = Mode {
    executeMode :: Int,
    testMode    :: Int,
    debugMode   :: Int
} deriving (Show)

toInt :: Char -> Int
toInt c = ord c - 48

createMode str = Mode {
    executeMode = toInt $ str !! 0,
    testMode    = toInt $ str !! 1,
    debugMode   = toInt $ str !! 2
}
