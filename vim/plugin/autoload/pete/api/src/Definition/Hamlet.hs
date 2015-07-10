module Definition.Hamlet(
get
) where


import Definition.Data


get = Definition {
    repl      = "",
    options   = ["set expandtab", "set shiftwidth=4"],
    comment   = ("$# ", ""),
    executors = [],
    tools     = ["!Reload "],
    debuggers = [""]
}
