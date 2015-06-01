module Definition.Haskell(
get
) where


import Definition.Data


get = Definition {
    repl      = "!cabal repl",
    options   = ["set expandtab"],
    comment   = ("-- ", ""),
    executors = ["!cabal run ", "!runhaskell "],
    tools     = ["!hlint ", "!cabal configure | cabal build "],
    debuggers = ["print %s", "putStr %s"]
}
