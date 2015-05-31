module Data(
Definition(..),
Comment,
Contents
) where


type Comment = (String, String)
type Contents = [String]


data Definition = Definition {
    repl      :: String,
    options   :: Contents,
    comment   :: Comment,
    executors :: Contents,
    tools     :: Contents,
    debuggers :: Contents
} deriving (Show)
