import Test.HUnit
import System.IO

import Comment


commentizeList = TestList [
        "normal"    ~: commentize "pete"          "php"  ~?= "// pete",
        "space"     ~: commentize "  pete"        "php"  ~?= "//   pete",
        "tab"       ~: commentize "\tpete"        "php"  ~?= "// \tpete",
        "tab-space" ~: commentize "\t pete"       "php"  ~?= "// \t pete",
        "dollar"    ~: commentize "echo $pete;"   "php"  ~?= "// echo $pete;",
        "double"    ~: commentize "// pete"       "php"  ~?= "// // pete",
        "surround"  ~: commentize "pete"          "html" ~?= "<!-- pete -->",
        "s-double"  ~: commentize "<!-- pete -->" "html" ~?= "<!-- <!-- pete --> -->"
    ]


decommentizeList = TestList [
        "normal"    ~: decommentize "// pete"                "php"  ~?= "pete",
        "space"     ~: decommentize "//  pete"               "php"  ~?= " pete",
        "tab"       ~: decommentize "// \tpete"              "php"  ~?= "\tpete",
        "tab-space" ~: decommentize "// \t pete"             "php"  ~?= "\t pete",
        "dollar"    ~: decommentize "// echo $pete;"         "php"  ~?= "echo $pete;",
        "double"    ~: decommentize "// // echo $pete;"      "php"  ~?= "// echo $pete;",
        "surround"  ~: decommentize "<!-- pete -->"          "html" ~?= "pete",
        "s-double"  ~: decommentize "<!-- <!-- pete --> -->" "html" ~?= "<!-- pete -->"
    ]


main = do
    runTestText (putTextToHandle stderr False) commentizeList
    runTestText (putTextToHandle stderr False) decommentizeList
    return ()
