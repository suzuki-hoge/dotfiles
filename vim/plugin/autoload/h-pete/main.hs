import Pete
import Mode
import Comment

import Data.List

dispath :: Maybe Pete -> String -> Mode -> String -> String
dispath (Just pete) command mode text
    | command == "commentize"   = commentize   comment text
    | command == "decommentize" = decommentize comment text
    | command == "switch"       = switch       comment text
    | command == "execute"      = executor
    | command == "test"         = tester
    | command == "debug"        = debugger text
    | command == "help"         = help pete mode "pete"
    where comment  = Pete.comment   pete
          executor = Pete.executors pete !! (executeMode mode)
          tester   = Pete.testers   pete !! (testMode    mode)
          debugger = Pete.debuggers pete !! (debugMode   mode)
dispath Nothing _ _ _ = "--- not found pete ---"




help pete mode text = intercalate "\n" $ comment ++ testers ++ executors ++ debuggers
    where comment = ["  comment: " ++ commentize (Pete.comment pete) text]
          executorPre current n executor | n == current = "* executor : " ++ executor
          executorPre current n executor | n /= current = "  executor : " ++ executor
          executors = zipWith (executorPre $ Mode.executeMode mode) [0..] $ Pete.executors pete
          testerPre current n tester | n == current = "* tester : " ++ tester
          testerPre current n tester | n /= current = "  tester : " ++ tester
          testers = zipWith (testerPre $ Mode.testMode mode) [0..] $ Pete.testers pete
          debuggerPre current n debugger | n == current = "* debugger : " ++ debugger text
          debuggerPre current n debugger | n /= current = "  debugger : " ++ debugger text
          debuggers = zipWith (debuggerPre $ Mode.debugMode mode) [0..] $ Pete.debuggers pete






main = do
    let pete = createPete "php"
    let command = "help"
    let mode = createMode "000"
    let text = "hoge"

    putStr $ dispath pete command mode text
