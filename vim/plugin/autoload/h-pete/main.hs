import Pete
import Mode
import Comment
import Help

dispath :: Maybe Pete -> String-> String -> Mode -> String -> String
dispath (Just pete) extension command mode text
    | command == "commentize"   = commentize   comment text
    | command == "decommentize" = decommentize comment text
    | command == "switch"       = switch       comment text
    | command == "repl"         = repl
    | command == "execute"      = executor
    | command == "test"         = tester
    | command == "edit"         = edit text extension
    | command == "debug"        = debugger text
    | command == "help"         = help pete extension mode "pete"
    where comment  = Pete.comment   pete
          repl     = Pete.repl      pete
          executor = Pete.executors pete !! (executeMode mode)
          tester   = Pete.testers   pete !! (testMode    mode)
          edit     = Pete.edit      pete
          debugger = Pete.debuggers pete !! (debugMode   mode)
dispath Nothing _ _ _ _ = "--- not found pete ---"

main = do
    let extension = "php"
    let pete = createPete extension
    let command = "edit"
    let mode = createMode "000"
    let text = "hoge"

    putStr $ dispath pete extension command mode text
