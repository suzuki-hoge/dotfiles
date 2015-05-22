import Control.Applicative
import System.Environment(getArgs)

import Mode
import Comment
import Repl
import Debuggers
import Edit
import Options
import Executors
import Makers
import Testers

-- 各ヘルプはここで
-- HコマンドはHelp.hsで
-- テスト作る
-- 行間や順番
-- 型注釈
-- hoge[s]
dispath command modeString text ext
    | command == "Commentize"     = Comment.commentize  text ext
    | command == "Decommentize"     = Comment.decommentize  text ext
    | command == "Switch"     = Comment.switch  text ext
    | command == "Debug"     = Debuggers.get  (debugMode mode) text ext
    | command == "DebugHelp" = Debuggers.help (debugMode mode) ext
    | command == "Repl"     = Repl.get  ext
    | command == "Edit"     = Edit.get text ext
    | command == "Options"     = Options.get ext
    | command == "Execute"     = Executors.get  (executeMode mode) ext
    | command == "Make"     = Makers.get  (makeMode mode) ext
    | command == "Test"     = Testers.get  (testMode mode) ext
    where mode = createMode modeString

main = do
    command    <- (!! 0) <$> getArgs
    modeString <- (!! 1) <$> getArgs
    text       <- (!! 2) <$> getArgs
    ext        <- (!! 3) <$> getArgs

    putStr $ dispath command modeString text ext
