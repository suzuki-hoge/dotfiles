import Pete
import Comment

dispath :: Maybe Pete -> String -> Int -> String -> String
dispath (Just pete) command mode text
    | command == "commentize"   = commentize   comment text
    | command == "decommentize" = decommentize comment text
    | command == "switch"       = switch       comment text
    | command == "debug"        = debugger text
    | command == "execute"      = executor
    where comment  = Pete.comment pete
          debugger = Pete.debuggers pete !! mode
          executor = Pete.executors pete !! mode
dispath Nothing _ _ _ = "--- not found pete ---"


main = do
    let pete = createPete "php"
    let command = "execute"
    let mode = read "0" :: Int
    let text = "hoge"

    putStr $ dispath pete command mode text
