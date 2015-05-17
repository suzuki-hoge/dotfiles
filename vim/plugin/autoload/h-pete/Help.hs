module Help(
help
) where

import Data.List

import Pete
import Mode
import Comment

(+++) xs ys = xs ++ [""] ++ ys
help pete extension mode text = intercalate "\n" $ comment +++ repl +++ edit +++ options +++ testers +++ executors +++ debuggers
    where comment = ["  comment     " ++ commentize (Pete.comment pete) text]
          repl = ["  repl        " ++ (Pete.repl pete)]
          edit = ["  edit        " ++ ((Pete.edit pete) text extension)]
          optionsPre option = "  options     " ++ option
          options = map optionsPre $ Pete.options pete
          executorPre current n executor | n == current = "* executor    " ++ executor
          executorPre current n executor | n /= current = "  executor    " ++ executor
          executors = zipWith (executorPre $ Mode.executeMode mode) [0..] $ Pete.executors pete
          testerPre current n tester | n == current = "* tester      " ++ tester
          testerPre current n tester | n /= current = "  tester      " ++ tester
          testers = zipWith (testerPre $ Mode.testMode mode) [0..] $ Pete.testers pete
          debuggerPre current n debugger | n == current = "* debugger    " ++ debugger text
          debuggerPre current n debugger | n /= current = "  debugger    " ++ debugger text
          debuggers = zipWith (debuggerPre $ Mode.debugMode mode) [0..] $ Pete.debuggers pete
