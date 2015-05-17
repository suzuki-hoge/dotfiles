module Pete
(Pete(..),
createPete
) where

import Control.Monad

data Pete = Pete {
    comment   :: (String, String),
    executors :: [String],
    testers   :: [String],
    debuggers :: [String -> String]
}

instance Show Pete where
    show (Pete (head, tail) executors testers debuggers) = "\nhead: " ++ head ++ "\ntail: " ++ tail

petes = [("php", Pete {
                        comment   = ("-- ", ""),
                        executors  = ["!php ", "R"],
                        testers    = ["!phpunit "],
                        debuggers = [\text -> "var_dump($" ++ text ++ ");",
                                     \text -> "print_r($" ++ text ++ ");"] }),
         ("js", Pete {
                        comment   = ("// ", ""),
                        executors  = ["R"],
                        testers    = [""],
                        debuggers = [\text -> "console.log(" ++ text ++ ");"] })]

createPete' []         _                          = Nothing
createPete' ((k,v):xs) extension | k == extension = Just v
createPete' (_:xs)     extension | otherwise      = createPete' xs extension

createPete extension = createPete' petes extension
