import System.Environment (getArgs)
import Data.Char (ord)
import Data.List (nub, transpose, intercalate)
import Data.List.Split (splitOn)
import Text.Printf (printf)

type Line = String
type Cols = [String]
type Maximums = [Int]
type Delim = String

len :: String -> Int
len = sum . map (\c -> if ord c < 127 then 1 else 2)

delims :: Delim -> [Line] -> [Int]
delims orgDelim = map (len . filter (== head orgDelim))

isValidCommas :: Delim -> [Line] -> Bool
isValidCommas d lines = (== 1) . length . nub $ delims d lines

maximums :: Delim -> [Line] -> Maximums
maximums orgDelim = map maximum . transpose . map (map len . cols orgDelim)

alignAll :: Delim -> Delim -> Maximums -> [Line] -> [Line]
alignAll orgDelim dstDelim ns = map (intercalate dstDelim . align ns . cols orgDelim)
    where
        align :: Maximums -> Cols -> Cols
        align = zipWith pad
            where pad n col = col ++ replicate (n - len col) ' '

cols :: Delim -> Line -> Cols
cols d = map (filter (/= ' ')) . splitOn d

convert :: Delim -> Delim -> [Line] -> String
convert orgDelim dstDelim lines = let
    widths = maximums orgDelim lines
    in unlines $ alignAll orgDelim dstDelim widths lines

invalidCommas :: Delim -> [Line] -> String
invalidCommas d lines = ("delimiter mismatch\n" ++) . unlines . map show $ delims d lines

main :: IO ()
main = do
    lines <- splitOn "\\n" . (!! 0) <$> getArgs
    orgDelim <- (!! 1) <$> getArgs
    dstDelim <- (!! 2) <$> getArgs

    putStr $ if isValidCommas orgDelim lines then convert orgDelim dstDelim lines else invalidCommas orgDelim lines
