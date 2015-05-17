import Pete
import Comment

dispath :: Maybe Pete -> String -> Int -> String -> String
dispath (Just pete) command mode text
    | command == "commentize"   = commentize   comment text
    | command == "decommentize" = decommentize comment text
    | command == "switch"       = switch       comment text
    | command == "debug"        = f text
    where comment = Pete.comment pete
          f       = Pete.debuggers pete !! mode
dispath Nothing _ _ _ = "--- pete failure ---"


main = do
    let pete = createPete "html"
    let command = "debug"
    let mode = read "0" :: Int
    let text = "hoge"

    putStr $ dispath pete command mode text
