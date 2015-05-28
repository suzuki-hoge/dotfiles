module Output(
mkEntry,
output
) where


import Data.List.Split

import Data


mkEntry :: Path -> String -> Entry
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
    let close = if diff > 0 then take diff $ repeat '}' else ""

    putStr $ line x
    putStrLn close

    output $ y : zs


output [x] = do
    let close = if (depth x) /= 1 then take (depth x - 1) $ repeat '}' else ""

    putStr $ line x
    putStrLn close
