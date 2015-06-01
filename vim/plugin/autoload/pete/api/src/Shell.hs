module Shell(
get
) where


import Data


get = Definition {
    repl      = "",
    options   = [],
    comment   = ("# ", ""),
    executors = ["!sh "],
    tools     = [],
    debuggers = ["echo %s"]
}
