module Output(
mkEntry,
indentOutput,
fullOutput
) where


import Data.List.Split

import Data


mkEntry :: Path -> String -> Entry
mkEntry root awkedLines = Entry { full = full, name = name, depth = depth, indent = indent, slash = slash, line = line }
    where ftype  = head $ splitOn " " awkedLines
          full   = last $ splitOn " " awkedLines
          path   = drop (length root) full
          depth  = length $ splitOn "/" path
          indent = replicate ((depth -1) * 4) ' '
          name   = last $ splitOn "/" full
          slash  = if head ftype == 'd' then "/" else ""
          line   = indent ++ name ++ slash


bracket diff
	| diff > 0 = replicate diff '}'
	| diff < 0 = "{"
	| otherwise = ""


indentOutput :: [Entry] -> IO ()
indentOutput (x:y:zs) = do
    let diff = depth x - depth y

    putStr $ line x
    putStrLn $ bracket diff

    indentOutput $ y : zs

indentOutput [x] = do
    let close = if depth x /= 1 then replicate (depth x - 1) '}' else ""

    putStr $ line x
    putStrLn close


fullOutput :: [Entry] -> IO ()
fullOutput (x:xs) = do
    putStrLn $ full x

    fullOutput xs

fullOutput [] = return ()
