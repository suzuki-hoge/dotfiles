
import Text.Printf

import Data
import Haskell

import Comment


dispatch command mode text def ext
    | command == "Repl"          = repl def
    | command == "Edit"          = printf "tabedit %s.%s" text ext :: String
    | command == "Options"       = options def !! 0
    -- | command == "OptionsHelp"   = "a"
    | command == "Commentize"    = commentize   (comment def) text
    | command == "Decommentize"  = decommentize (comment def) text
    | command == "Switch"        = switch       (comment def) text
    | command == "Execute"       = executors def !! 0
    -- | command == "ExecuteHelp"   = "a"
    | command == "Tool"          = tools def !! 0
    -- | command == "ToolHelp"      = "a"
    | command == "Debug"         = printf (debuggers def !! 0) text :: String
    -- | command == "DebugHelp"     = "a"
    

getDef "hs" = Haskell.get

main = do
    let command    = "Decommentize"
    let modeString = "0000"
    let text       = "pete"
    let ext        = "hs"

    let def = getDef ext
    print $ dispatch command modeString text def ext
