module Pete
(Pete(..),
createPete,
) where

import Control.Monad

data Pete = Pete {
    extension :: String,
    comment   :: (String, String),
    repl      :: String,
    edit      :: String -> String -> String,
    options   :: [String],
    executors :: [String],
    makers    :: [String],
    testers   :: [String],
    debuggers :: [String -> String]
}

instance Show Pete where
    show (Pete extension (head, tail) repl edit options executors makers testers debuggers) = ""

petes = [("php", Pete {
                        extension  = "php",
                        comment   = ("-- ", ""),
                        repl       = "!ghci",
                        edit       = tabedit,
                        options    = ["set expandtab", "set nowrap"],
                        executors  = ["!php ", "R"],
                        makers     = ["!ghc --make "],
                        testers    = ["!phpunit "],
                        debuggers  = [\text -> "var_dump($" ++ text ++ ");",
                                     \text -> "print_r($" ++ text ++ ");"] }),
         ("js", Pete {
                        extension  = "js",
                        comment   = ("// ", ""),
                        repl = "",
                        edit       = tabedit,
                        options    = ["set expandtab"],
                        executors  = ["R"],
                        makers     = ["!ghc --make "],
                        testers    = [""],
                        debuggers = [\text -> "console.log(" ++ text ++ ");"] })]

tabedit text extension = "tabedit $tmp/" ++ text ++ "." ++ extension

createPete' []         _                          = Nothing
createPete' ((k,v):xs) extension | k == extension = Just v
createPete' (_:xs)     extension | otherwise      = createPete' xs extension

createPete extension = createPete' petes extension
