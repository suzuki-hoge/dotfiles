module Definition.Php(
get
) where


import Definition.Data


get = Definition {
    repl      = "",
    options   = [],
    comment   = ("// ", ""),
    executors = ["!php "],
    tools     = ["!Reload "],
    debuggers = ["echo '<pre>';\nvar_dump($%s);\nexit;"]
}
