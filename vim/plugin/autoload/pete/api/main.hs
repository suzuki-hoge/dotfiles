import Data.List
import Control.Applicative
import System.Environment(getArgs)

import Pete
import Mode
import Comment
import Help

dispath :: Maybe Pete -> String-> Mode -> String -> String
dispath (Just pete) command mode text
    | command == "commentize"   = commentize   comment text
    | command == "decommentize" = decommentize comment text
    | command == "switch"       = switch       comment text
    | command == "repl"         = repl
    | command == "edit"         = edit text extension
    | command == "options"      = options
    | command == "execute"      = executor
    | command == "make"         = maker
    | command == "test"         = tester
    | command == "debug"        = debugger text
    | command == "help"         = help pete mode text
    where extension = Pete.extension pete
          comment   = Pete.comment   pete
          repl      = Pete.repl      pete
          edit      = Pete.edit      pete
          options   = intercalate "\n" $ Pete.options pete
          executor  = Pete.executors pete !! (executeMode mode)
          maker     = Pete.makers    pete !! (makeMode    mode)
          tester    = Pete.testers   pete !! (testMode    mode)
          debugger  = Pete.debuggers pete !! (debugMode   mode)
dispath Nothing _ _ _ = "--- not found pete ---"

main = do
    extension <- (!! 0) <$> getArgs
    let pete = createPete extension

    command <- (!! 1) <$> getArgs

    mode' <- (!! 2) <$> getArgs
    let mode = createMode mode'

    text <- (!! 3) <$> getArgs

    putStr $ dispath pete command mode text
