module Data(
Definition(..),
Comment
) where

type Comment = (String, String)

data Definition = Definition {
    repl      :: String,
    options   :: [String],
    comment   :: Comment,
    executors :: [String],
    tools     :: [String],
    debuggers :: [String]
} deriving (Show)
