module Python(
get
) where


import Data


get = Definition {
    repl      = "!python",
    options   = [],
    comment   = ("# ", ""),
    executors = ["!python -B "],
    tools     = ["Reload "],
    debuggers = ["print %s"]
}
