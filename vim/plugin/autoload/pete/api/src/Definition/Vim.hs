module Definition.Vim(
get
) where


import Definition.Data


get = Definition {
    repl      = "",
    options   = [],
    comment   = ("\" ", ""),
    executors = ["call "],
    tools     = ["source "],
    debuggers = ["echo %s"]
}
