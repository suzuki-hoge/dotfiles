module Pete
(Pete(..)
,createPete
) where

import Control.Monad

data Pete = Pete { comment :: (String, String), debuggers :: [String -> String] }

instance Show Pete where
    show (Pete (head, tail) debuggers) = "\nhead: " ++ head ++ "\ntail: " ++ tail

petes = [("html", Pete {
                        comment   = ("<!-- ", " -->"),
                        debuggers = [\text -> "print $ " ++ text,
                                     \text -> "putStr $ " ++ text] }),
         ("js",   Pete {
                        comment   = ("// ", ""),
                        debuggers = [\text -> "console.log(" ++ text ++ ");"] })]

createPete' []         _                          = Nothing
createPete' ((k,v):xs) extension | k == extension = Just v
createPete' (_:xs)     extension | otherwise      = createPete' xs extension

createPete extension = createPete' petes extension
