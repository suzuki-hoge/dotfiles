module Definition.Python(
get
) where


import Definition.Data


get = Definition {
    repl      = "!python",
    options   = [],
    comment   = ("# ", ""),
    executors = ["!python -B "],
    tools     = ["Reload "],
    debuggers = ["print %s"]
}
