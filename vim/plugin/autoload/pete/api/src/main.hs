import Text.Printf
import Control.Exception

import Mode

import Data
import Haskell

import Comment


dispatch :: String -> Mode -> String -> Definition -> String -> String
dispatch command mode text definition ext
    | command == "Repl"          = repl definition
    | command == "Edit"          = printf "tabedit %s.%s" text ext
    | command == "Options"       = unlines $ options definition
    | command == "Commentize"    = commentize   text $ comment definition
    | command == "Decommentize"  = decommentize text $ comment definition
    | command == "Switch"        = switch       text $ comment definition
    | command == "Execute"       = executors definition !! executeMode
    | command == "Tool"          = tools definition !! toolMode
    | command == "Debug"         = printf (debuggers definition !! debugMode) text
    | command == "ToolHelp"      = helpLines toolMode    text $ tools     definition
    | command == "ExecuteHelp"   = helpLines executeMode text $ executors definition
    | command == "DebugHelp"     = helpLines debugMode   text $ debuggers definition
    where executeMode = execute mode
          toolMode    = tool mode
          debugMode   = debug mode
    

getDefinition :: String -> Definition
getDefinition ext
    | ext == "hs" = Haskell.get


pre :: Int -> String -> Int -> (String -> String)
pre mode text i | mode == i = \s -> "* " ++ s ++ text
pre mode text i | mode /= i = \s -> "  " ++ s ++ text


helpLines :: Int -> String -> Contents -> String
helpLines mode text contents = unlines $ zipWith prefix [0..] contents
    where prefix = pre mode text


call :: IO ()
call = do
    let command    = "Toollll"
    let mode       = create "333"
    let text       = "pete"
    let ext        = "hs"

    let definition = getDefinition ext

    putStr $ dispatch command mode text definition ext
    return ()


cover :: SomeException -> IO ()
cover _ = do
    putStr "invalid"
    return ()

main = do
    call `catch` cover
