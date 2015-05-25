module Mode
(Mode(..),
createMode
) where


import Data.Char

import Lib


data Mode = Mode {
    executeMode :: Int,
    makeMode    :: Int,
    testMode    :: Int,
    debugMode   :: Int
} deriving (Show)


toInt :: Maybe Char -> Int
toInt (Just c) = ord c - 48
toInt Nothing  = 0


createMode :: String -> Mode
createMode str = Mode {
    executeMode = toInt $ str !!! 0,
    makeMode    = toInt $ str !!! 1,
    testMode    = toInt $ str !!! 2,
    debugMode   = toInt $ str !!! 3
}


main = do
    let m1 = createMode "4521"
    let m2 = createMode "281"
    let m3 = createMode ""

    print m1
    print m2
    print m3
