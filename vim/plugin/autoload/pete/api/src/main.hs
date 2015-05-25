import Control.Applicative
import System.Environment(getArgs)

import Lib
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


dispath :: Maybe String -> Maybe String -> Maybe String -> Maybe String -> Maybe String
dispath (Just command) (Just modeString) (Just text) (Just ext)
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
    | command == "Execute"             = Executors.get  (executeMode mode) text ext
    | command == "ExecuteHelp"         = Executors.help (executeMode mode) text ext
    | command == "Make"                = Makers.get  (makeMode mode)    text ext
    | command == "MakeHelp"            = Makers.help (makeMode mode)    text ext
    | command == "Test"                = Testers.get  (testMode mode)    text ext
    | command == "TestHelp"            = Testers.help (testMode mode)    text ext
    | command == "Debug"               = Debuggers.get  (debugMode mode) text ext
    | command == "DebugHelp"           = Debuggers.help (debugMode mode) text ext
    | command == "Help"                = Help.line mode text ext
    where mode = createMode modeString
dispath _ _ _ _ = Nothing


echo (Just s) = putStr s
echo Nothing  = putStr "invalid"

main = do
    command    <- (!!! 0) <$> getArgs
    modeString <- (!!! 1) <$> getArgs
    text       <- (!!! 2) <$> getArgs
    ext        <- (!!! 3) <$> getArgs

    echo $ dispath command modeString text ext
