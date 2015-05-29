module Output(
mkEntry,
indentOutput,
fullOutput
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
          slash  = if ftype !! 0 == 'd' then "/" else ""
          line   = indent ++ name ++ slash


bracket diff
	| diff > 0 = take diff $ repeat '}'
	| diff < 0 = "{"
	| otherwise = ""


indentOutput :: [Entry] -> IO ()
indentOutput (x:y:zs) = do
    let diff = (depth x) - (depth y)

    putStr $ line x
    putStrLn $ bracket diff

    indentOutput $ y : zs

indentOutput [x] = do
    let close = if (depth x) /= 1 then take (depth x - 1) $ repeat '}' else ""

    putStr $ line x
    putStrLn close


fullOutput :: [Entry] -> IO ()
fullOutput (x:xs) = do
    putStrLn $ full x

    fullOutput xs

fullOutput [] = return ()
