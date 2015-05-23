module Mode
(Mode(..),
createMode
) where


import Data.Char


data Mode = Mode {
    executeMode :: Int,
    makeMode    :: Int,
    testMode    :: Int,
    debugMode   :: Int
} deriving (Show)


toInt :: Char -> Int
toInt c = ord c - 48


createMode :: String -> Mode
createMode str = Mode {
    executeMode = toInt $ str !! 0,
    makeMode    = toInt $ str !! 1,
    testMode    = toInt $ str !! 2,
    debugMode   = toInt $ str !! 3
}


main = do
	print $ createMode "0000"
	print $ createMode "1234"
