import System.Environment(getArgs)
import Control.Applicative

import System
import Output


main = do
    root <- (!! 0) <$> getArgs
    mode <- (!! 1) <$> getArgs

    let root = "/Users/ryo/.dotfiles/vim/plugin/autoload/frank"
    let mode = "indent"

    foundLines <- find $ mkFindOptions root [".git", ".svn", ".vagrant", ".DS_Store", "*.pyc", "dist", ".cabal-sandbox"]
    awkedLines <- awk mkAwkOptions foundLines

    let entries = map (mkEntry root) $ lines awkedLines

    if mode == "indent"
        then
            indentOutput entries
        else
            fullOutput entries
