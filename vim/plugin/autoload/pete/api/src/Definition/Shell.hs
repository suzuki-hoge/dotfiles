module Definition.Shell(
get
) where


import Definition.Data


get = Definition {
    repl      = "",
    options   = [],
    comment   = ("# ", ""),
    executors = ["!sh "],
    tools     = [],
    debuggers = ["echo %s"]
}
