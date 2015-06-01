module Vim(
get
) where


import Data


get = Definition {
    repl      = "",
    options   = [],
    comment   = ("\" ", ""),
    executors = ["call "],
    tools     = ["source "],
    debuggers = ["echo %s"]
}
