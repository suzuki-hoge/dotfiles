import System.Process
import Control.Applicative
import Data.List.Split
import Control.Monad
import System.Directory


mkOptions :: String -> [String] -> [String]
mkOptions path blackNames = [path] ++ (blacks blackNames) ++ ["-ls"]


blacks :: [String] -> [String]
blacks []     = []
blacks [x]    = black x
blacks (x:xs) = black x ++ blacks xs


black :: String -> [String]
black name = ["-name", name, "-prune", "-or"]


-- find :: [String] -> Path
find options = readProcess "find" options []


mk root aline = indent ++ name ++ slash
    where ftype  = splitOn " " aline !! 0
          full   = splitOn " " aline !! 1
          path   = drop (length root) full
          depth  = length $ splitOn "/" path
          indent = take ((depth -1) * 4) $ repeat ' '
          name   = last $ splitOn "/" full
          slash  = if ftype !! 0 == 'd' then "/" else ""

main = do
    let root = "/Users/ryo/.dotfiles/vim/plugin/autoload/pete"
    let options = mkOptions root [".git", ".svn", ".vagrant", ".DS_Store", "*.pyc", "dist", ".cabal-sandbox"]
    

    ls <- find options
    alines <- readProcess "awk" ["{ print $3,$11 }"] ls

    let es = map (mk root) $ lines alines
    putStr $ unlines es
