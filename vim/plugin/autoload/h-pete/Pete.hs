module Pete
(Pete(..)
,createPete
) where

import Control.Monad

data Pete = Pete { comment :: (String, String) } deriving (Show)
petes = [("html", Pete { comment = ("<!-- ", " -->") })]

createPete' []         _                          = Nothing
createPete' ((k,v):xs) extension | k == extension = Just v
createPete' (_:xs)     extension | otherwise      = createPete' xs extension

createPete extension = createPete' petes extension
