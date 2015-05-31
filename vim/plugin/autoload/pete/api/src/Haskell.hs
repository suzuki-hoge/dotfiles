module Haskell(
get
) where


import Data


get = Definition {
    repl      = "!cabal repl",
    options   = ["set expandtab", "set nowrap"],
    comment   = ("-- ", ""),
    executors = ["!cabal run ", "!runhaskell "],
    tools     = ["!hlint ", "!cabal configure | cabal build "],
    debuggers = ["print %s"]
}
