module Definition.Haskell(
get
) where


import Definition.Data


get = Definition {
    repl      = "!cabal repl",
    options   = ["set expandtab"],
    comment   = ("-- ", ""),
    executors = ["!cabal run ", "!runhaskell ", "!cabal exec runghc "],
    tools     = ["!hlint ", "!cabal configure | cabal build ", "!cabal exec ghc -- --make "],
    debuggers = ["print %s", "putStr %s"]
}
