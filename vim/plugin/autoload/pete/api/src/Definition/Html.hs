module Definition.Html(
get
) where


import Definition.Data


get = Definition {
    repl      = "",
    options   = [],
    comment   = ("<!-- ", " -->"),
    executors = ["Reload "],
    tools     = ["Reload "],
    debuggers = ["<p>%s</p>"]
}
