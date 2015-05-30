module Output(
mkEntry,
indentOutput,
fullOutput
) where


import Data.List.Split

import Data


space :: Int -> String
space n = replicate (n * 4) ' '


close :: Int -> String
close n = replicate n '}'


mkEntry :: Path -> String -> Entry
mkEntry root awkedLines = Entry { full = full, name = name, depth = depth, indent = indent, slash = slash, line = line }
    where ftype  = head $ splitOn " " awkedLines
          full   = last $ splitOn " " awkedLines
          path   = drop (length root) full
          depth  = length $ splitOn "/" path
          indent = space (depth -1)
          name   = last $ splitOn "/" full
          slash  = if head ftype == 'd' then "/" else ""
          line   = indent ++ name ++ slash


bracket :: Int -> String
bracket diff
	| diff > 0 = close diff
	| diff < 0 = "{"
	| otherwise = ""


indentOutput :: [Entry] -> IO ()
indentOutput (x:y:zs) = do
    let diff = depth x - depth y

    putStr $ line x
    putStrLn $ bracket diff

    indentOutput $ y : zs

indentOutput [x] = do
    let bracket = if depth x /= 1 then close (depth x - 1) else ""

    putStr $ line x
    putStrLn bracket


fullOutput :: [Entry] -> IO ()
fullOutput (x:xs) = do
    putStrLn $ full x

    fullOutput xs

fullOutput [] = return ()
