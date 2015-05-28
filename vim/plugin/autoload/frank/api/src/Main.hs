import System
import Output


main = do
    let root = "/Users/ryo/.dotfiles/vim/plugin/autoload/pete"
    let findOptions = mkFindOptions root [".git", ".svn", ".vagrant", ".DS_Store", "*.pyc", "dist", ".cabal-sandbox"]
    

    foundLines <- find findOptions
    awkedLines <- awk mkAwkOptions foundLines

    output $ map (mkEntry root) $ lines awkedLines
