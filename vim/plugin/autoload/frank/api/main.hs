import Entry
import Output
import System.Environment(getArgs)

output mode root | mode == "indented" = Output.indented (kind root) root
output mode root | mode == "full"     = Output.full (kind root) root
output _    _                         = putStrLn "invalid arguments"

main = do
    args <- getArgs
    let path = args !! 0
    let mode = args !! 1

    subs <- Entry.getEntries path
    let root = Entry.Directory { path = path, kind = Entry.D, subs = subs }

    output mode root
