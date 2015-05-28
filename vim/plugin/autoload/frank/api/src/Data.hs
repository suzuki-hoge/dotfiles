module Data(
Path,
Entry(..)
) where


type Path = String

data Entry = Entry { full :: Path, name :: String, depth :: Int, indent :: String, slash :: String, line :: String } deriving (Show)
