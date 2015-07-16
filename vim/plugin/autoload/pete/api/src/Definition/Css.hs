module Definition.Css(
get
) where


import Definition.Data


get = Definition {
    repl      = "",
    options   = [],
    comment   = ("// ", ""),
    executors = ["Reload "],
    tools     = ["Reload "],
    debuggers = ["%s"]
}
