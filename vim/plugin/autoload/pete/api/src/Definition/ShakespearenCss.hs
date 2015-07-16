module Definition.ShakespearenCss(
get
) where


import Definition.Data


get = Definition {
    repl      = "",
    options   = ["set expandtab"],
    comment   = ("// ", ""),
    executors = ["Reload "],
    tools     = ["Reload "],
    debuggers = ["%s"]
}
