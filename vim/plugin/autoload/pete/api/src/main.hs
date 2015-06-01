import Control.Applicative
import System.Environment(getArgs)
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
    | command == "Execute"       = executors definition !! executeMode ++ text
    | command == "Tool"          = tools definition !! toolMode ++ text
    | command == "Debug"         = printf (debuggers definition !! debugMode) text
    | command == "ToolHelp"      = helpLines toolMode    text $ tools     definition
    | command == "ExecuteHelp"   = helpLines executeMode text $ executors definition
    | command == "DebugHelp"     = helpLines debugMode "" formated
    where executeMode = execute mode
          toolMode    = tool mode
          debugMode   = debug mode
          formated    = map (\def -> printf def "pete" :: String) $ debuggers definition
    

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
    command <- (!! 0) <$> getArgs
    mode    <- create <$> (!! 1) <$> getArgs
    text    <- (!! 2) <$> getArgs
    ext     <- (!! 3) <$> getArgs

    let definition = getDefinition ext

    putStr $ dispatch command mode text definition ext
    return ()


cover :: SomeException -> IO ()
cover _ = do
    putStr "invalid"
    return ()

main = do
    call `catch` cover
