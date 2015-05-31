
import Text.Printf

import Mode

import Data
import Haskell

import Comment


dispatch command mode text def ext
    | command == "Repl"          = repl def
    | command == "Edit"          = printf "tabedit %s.%s" text ext :: String
    | command == "Options"       = options def !! 0
    | command == "OptionsHelp"   = unlines $ options def
    | command == "Commentize"    = commentize   (comment def) text
    | command == "Decommentize"  = decommentize (comment def) text
    | command == "Switch"        = switch       (comment def) text
    | command == "Execute"       = executors def !! executeMode
    | command == "ExecuteHelp"   = helpLines executeMode text (executors def)
    | command == "Tool"          = tools def !! 0
    -- | command == "ToolHelp"      = "a"
    | command == "Debug"         = printf (debuggers def !! 0) text :: String
    -- | command == "DebugHelp"     = "a"
    where executeMode = execute mode
    

getDef "hs" = Haskell.get



pre n text i | n == i = \s -> "* " ++ s ++ text
pre n text i | n /= i = \s -> "  " ++ s ++ text


helpLines n text definitions = unlines $ zipWith prefix [0..] definitions
    where prefix = pre n text



main = do
    let command    = "ExecuteHelp"
    let mode       = create "100"
    let text       = "pete"
    let ext        = "hs"

    let def = getDef ext
    putStr $ dispatch command mode text def ext
