
import Text.Printf

import Mode

import Data
import Haskell

import Comment


dispatch command mode text def ext
    | command == "Repl"          = repl def
    | command == "Edit"          = printf "tabedit %s.%s" text ext :: String
    | command == "Options"       = unlines $ options def
    | command == "Commentize"    = commentize   (comment def) text
    | command == "Decommentize"  = decommentize (comment def) text
    | command == "Switch"        = switch       (comment def) text
    | command == "Execute"       = executors def !! executeMode
    | command == "ExecuteHelp"   = helpLines executeMode text (executors def)
    | command == "Tool"          = tools def !! toolMode
    | command == "ToolHelp"      = helpLines toolMode text (tools def)
    | command == "Debug"         = printf (debuggers def !! debugMode) text :: String
    | command == "DebugHelp"     = helpLines debugMode text (debuggers def)
    where executeMode = execute mode
          toolMode    = tool mode
          debugMode   = debug mode
    

getDef "hs" = Haskell.get



pre mode text i | mode == i = \s -> "* " ++ s ++ text
pre mode text i | mode /= i = \s -> "  " ++ s ++ text


helpLines mode text definitions = unlines $ zipWith prefix [0..] definitions
    where prefix = pre mode text



main = do
    let command    = "Options"
    let mode       = create "100"
    let text       = "pete"
    let ext        = "hs"

    let def = getDef ext
    putStr $ dispatch command mode text def ext
