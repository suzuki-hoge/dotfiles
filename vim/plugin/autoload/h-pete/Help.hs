module Help(
help
) where

import Data.List

import Pete
import Mode
import Comment

help pete mode text = intercalate "\n" $ comment ++ testers ++ executors ++ debuggers
    where comment = ["  comment     " ++ commentize (Pete.comment pete) text]
          executorPre current n executor | n == current = "* executor    " ++ executor
          executorPre current n executor | n /= current = "  executor    " ++ executor
          executors = zipWith (executorPre $ Mode.executeMode mode) [0..] $ Pete.executors pete
          testerPre current n tester | n == current = "* tester      " ++ tester
          testerPre current n tester | n /= current = "  tester      " ++ tester
          testers = zipWith (testerPre $ Mode.testMode mode) [0..] $ Pete.testers pete
          debuggerPre current n debugger | n == current = "* debugger    " ++ debugger text
          debuggerPre current n debugger | n /= current = "  debugger    " ++ debugger text
          debuggers = zipWith (debuggerPre $ Mode.debugMode mode) [0..] $ Pete.debuggers pete
