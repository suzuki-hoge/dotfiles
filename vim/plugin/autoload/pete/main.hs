import Data.List

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
    | command == "help"         = help pete mode "pete"
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
    let pete = createPete "php"
    let command = "help"
    let mode = createMode "0000"
    let text = "hoge"

    putStr $ dispath pete command mode text
