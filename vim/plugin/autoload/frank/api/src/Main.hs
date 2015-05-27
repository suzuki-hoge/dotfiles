import Data.List.Split

import System


mkIndentedLine :: Path -> String -> String
mkIndentedLine root awkedLines = indent ++ name ++ slash
    where ftype  = splitOn " " awkedLines !! 0
          full   = splitOn " " awkedLines !! 1
          path   = drop (length root) full
          depth  = length $ splitOn "/" path
          indent = take ((depth -1) * 4) $ repeat ' '
          name   = last $ splitOn "/" full
          slash  = if ftype !! 0 == 'd' then "/" else ""


main = do
    let root = "/Users/ryo/.dotfiles/vim/plugin/autoload/pete"
    let findOptions = mkFindOptions root [".git", ".svn", ".vagrant", ".DS_Store", "*.pyc", "dist", ".cabal-sandbox"]
    

    foundLines <- find findOptions
    awkedLines <- awk mkAwkOptions foundLines

    let indentedLines = map (mkIndentedLine root) $ lines awkedLines
    putStr $ unlines indentedLines
