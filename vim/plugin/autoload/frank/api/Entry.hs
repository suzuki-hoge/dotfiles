module Entry
( Entry(..)
, Kind(..)
, getEntries
) where

import System.Directory
import Control.Monad
import System.FilePath.Posix

data Entry = Directory { path :: String , kind :: Kind, subs :: [Entry] }
           | File      { path :: String , kind :: Kind }
           deriving (Show)

data Kind = D | F deriving (Show)


blacks = [".", "..", ".svn", ".git", ".vagrant", ".DS_Store"]
isNotBlacks content = notElem content blacks

getWhites path = do
    contents <- getDirectoryContents path
    return $ map (path </>) (filter isNotBlacks contents)

getEntries path = do
    whites <- getWhites path

    subs <- forM whites $ \white -> do
        isD <- doesDirectoryExist white
        if isD
        then do
            subs <- getEntries white
            return (Directory { path = white, kind = D, subs = subs })
        else do
            return (File { path = white, kind = F })

    return subs
