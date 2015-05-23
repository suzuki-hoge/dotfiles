import Control.Applicative
import System.Environment(getArgs)

import Mode
import Repl
import Edit
import Options
import Comment
import Executors
import Makers
import Testers
import Debuggers
import Help


dispath :: String -> String -> String -> String -> String
dispath command modeString text ext
    | command == "Repl"                = Repl.get  ext
    | command == "ReplHelp"            = Repl.help ext
    | command == "Edit"                = Edit.get  text ext
    | command == "EditHelp"            = Edit.help text ext
    | command == "Options"             = Options.get  ext
    | command == "OptionsHelp"         = Options.help ext
    | command == "Commentize"          = Comment.commentize    text ext
    | command == "Decommentize"        = Comment.decommentize  text ext
    | command == "Switch"              = Comment.switch        text ext
    | command == "CommentHelp"         = Comment.help          text ext
    | command == "Execute"             = Executors.get  (executeMode mode) ext
    | command == "ExecuteHelp"         = Executors.help (executeMode mode) ext
    | command == "Make"                = Makers.get  (makeMode mode)    ext
    | command == "MakeHelp"            = Makers.help (makeMode mode)    ext
    | command == "Test"                = Testers.get  (testMode mode)    ext
    | command == "TestHelp"            = Testers.help (testMode mode)    ext
    | command == "Debug"               = Debuggers.get  (debugMode mode) text ext
    | command == "DebugHelp"           = Debuggers.help (debugMode mode) ext
    | command == "Help"                = Help.line mode text ext
    where mode = createMode modeString


main = do
    command    <- (!! 0) <$> getArgs
    modeString <- (!! 1) <$> getArgs
    text       <- (!! 2) <$> getArgs
    ext        <- (!! 3) <$> getArgs

    putStr $ dispath command modeString text ext
