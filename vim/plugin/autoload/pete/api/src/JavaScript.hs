module JavaScript(
get
) where


import Data


get = Definition {
    repl      = "",
    options   = [],
    comment   = ("// ", ""),
    executors = [],
    tools     = ["Reload "],
    debuggers = ["console.log(%s);"]
}
