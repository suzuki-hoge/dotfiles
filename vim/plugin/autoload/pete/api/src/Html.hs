module Html(
get
) where


import Data


get = Definition {
    repl      = "",
    options   = [],
    comment   = ("<!-- ", " -->"),
    executors = [],
    tools     = ["Reload "],
    debuggers = ["<p>%s</p>"]
}
