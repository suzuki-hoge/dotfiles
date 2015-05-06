import Entry
import Output
import System.Environment(getArgs)
import System.Directory
import Data.List.Split
import System.FilePath.Posix

main = do
    args <- getArgs
    let path = args !! 0
    let mode = args !! 1

    if mode == "indented"
        then do
            let root = dropFileName path
            let name = takeFileName path

            setCurrentDirectory root

            subs <- Entry.getEntries name
            let rootEntry = Entry.Directory { path = name, kind = Entry.D, subs = subs }

            Output.indented (kind rootEntry) rootEntry

        else do
            subs <- Entry.getEntries path
            let rootEntry = Entry.Directory { path = path, kind = Entry.D, subs = subs }

            Output.full (kind rootEntry) rootEntry
