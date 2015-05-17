import Pete
import Comment

dispath :: Maybe Pete -> String -> String -> String
dispath (Just pete) command line
    | command == "commentize"   = commentize   comment' line
    | command == "decommentize" = decommentize comment' line
    | command == "switch"       = switch       comment' line
    where comment' = comment pete
dispath Nothing _ _ = "--- pete failure ---"

main = do
    let pete = createPete "html"
    let command = "commentize"
    let line = "hoge"

    putStr $ dispath pete command line
