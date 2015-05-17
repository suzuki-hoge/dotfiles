module Pete
(Pete(..),
createPete,
) where

import Control.Monad

data Pete = Pete {
    comment   :: (String, String),
    repl      :: String,
    edit      :: String -> String -> String,
    options   :: [String],
    executors :: [String],
    testers   :: [String],
    debuggers :: [String -> String]
}

instance Show Pete where
    show (Pete (head, tail) repl edit options executors testers debuggers) = ""

petes = [("php", Pete {
                        comment   = ("-- ", ""),
                        repl       = "!ghci",
                        edit       = tabedit,
                        options    = ["set expandtab", "set nowrap"],
                        executors  = ["!php ", "R"],
                        testers    = ["!phpunit "],
                        debuggers  = [\text -> "var_dump($" ++ text ++ ");",
                                     \text -> "print_r($" ++ text ++ ");"] }),
         ("js", Pete {
                        comment   = ("// ", ""),
                        repl = "",
                        edit       = tabedit,
                        options    = ["set expandtab"],
                        executors  = ["R"],
                        testers    = [""],
                        debuggers = [\text -> "console.log(" ++ text ++ ");"] })]

tabedit text extension = "tabedit $tmp/" ++ text ++ "." ++ extension

createPete' []         _                          = Nothing
createPete' ((k,v):xs) extension | k == extension = Just v
createPete' (_:xs)     extension | otherwise      = createPete' xs extension

createPete extension = createPete' petes extension
