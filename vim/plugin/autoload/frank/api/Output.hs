module Output
( indented
, full
) where

import Control.Monad

import Data.List.Split
import Entry

-- recursively output with outputter >>>
recWithOutputter :: (String -> IO ()) -> Kind -> Entry -> IO ()

recWithOutputter outputter D entry = do
    outputter $ path entry
    forM_ (subs entry) $ \entry -> do
        recWithOutputter outputter (kind entry) entry

recWithOutputter outputter F entry = do
    outputter $ path entry
-- <<<

-- print full path only >>>
full' :: String -> IO ()

full' path = do
    putStrLn path
-- <<<

-- print indented name
indented' :: String -> IO ()

indented' path = do
    let count = getCount path * 4
    let space = repeat ' '

    putStr $ take count space
    putStrLn $ getName path
-- <<<

-- get indent space width
getCount :: String -> Int

getCount path = length $ filter (== "/") $ splitEvery 1 path
-- <<<

-- get name
getName :: String -> String

getName path = last $ splitOn "/" path
-- <<<

indented = recWithOutputter indented'
full = recWithOutputter full'
