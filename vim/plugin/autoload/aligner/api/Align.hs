import Fs

import System.Environment (getArgs)
import Data.List.Split (splitOn)

main :: IO ()
main = do
    lines <- splitOn "\\n" . (!! 0) <$> getArgs
    orgDelim <- (!! 1) <$> getArgs
    dstDelim <- (!! 2) <$> getArgs

    putStr $ fix orgDelim dstDelim lines
