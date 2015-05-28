import Data.List.Split

import System


data Entry = Entry { full :: Path, name :: String, depth :: Int, indent :: String, slash :: String, line :: String } deriving (Show)



mkEntry root awkedLines = Entry { full = full, name = name, depth = depth, indent = indent, slash = slash, line = line }
    where ftype  = splitOn " " awkedLines !! 0
          full   = splitOn " " awkedLines !! 1
          path   = drop (length root) full
          depth  = length $ splitOn "/" path
          indent = take ((depth -1) * 4) $ repeat ' '
          name   = last $ splitOn "/" full
          slash  = if ftype !! 0 == 'd' then "/{" else ""
          line   = indent ++ name ++ slash

output :: [Entry] -> IO ()
output (x:y:zs) = do
    let diff = (depth x) - (depth y)
    let b = if diff > 0 then take diff $ repeat '}' else ""

    putStr $ line x
    putStrLn b

    output $ y : zs

output [x] = do
    let b = if (depth x) /= 1 then take (depth x - 1) $ repeat '}' else ""

    putStr $ line x
    putStrLn b

main = do
    let root = "/Users/ryo/.dotfiles/vim/plugin/autoload/pete"
    let findOptions = mkFindOptions root [".git", ".svn", ".vagrant", ".DS_Store", "*.pyc", "dist", ".cabal-sandbox"]
    

    foundLines <- find findOptions
    awkedLines <- awk mkAwkOptions foundLines

    let es = map (mkEntry root) $ lines awkedLines

    output es
