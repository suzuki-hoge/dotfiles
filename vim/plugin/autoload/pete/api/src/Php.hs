module Php(
get
) where


import Data


get = Definition {
    repl      = "",
    options   = [],
    comment   = ("// ", ""),
    executors = ["!php "],
    tools     = ["Reload "],
    debuggers = ["echo '<pre>';\nvar_dump($%s);\nexit;"]
}
