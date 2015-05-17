module Pete
(Pete(..)
,createPete
) where

import Control.Monad

data Pete = Pete { comment :: (String, String), executors :: [String], debuggers :: [String -> String] }

instance Show Pete where
    show (Pete (head, tail) executors debuggers) = "\nhead: " ++ head ++ "\ntail: " ++ tail

petes = [("php", Pete {
                        comment   = ("-- ", ""),
                        executors  = ["!php ", "R"],
                        debuggers = [\text -> "var_dump($" ++ text ++ ");",
                                     \text -> "print_r($" ++ text ++ ");"] }),
         ("js", Pete {
                        comment   = ("// ", ""),
                        executors  = ["R"],
                        debuggers = [\text -> "console.log(" ++ text ++ ");"] })]

createPete' []         _                          = Nothing
createPete' ((k,v):xs) extension | k == extension = Just v
createPete' (_:xs)     extension | otherwise      = createPete' xs extension

createPete extension = createPete' petes extension
