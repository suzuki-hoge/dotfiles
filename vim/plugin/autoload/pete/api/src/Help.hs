module Help
(line
) where


import Mode
import Repl
import Edit
import Options
import Comment
import Executors
import Makers
import Testers
import Debuggers


(+++) :: Maybe String -> Maybe String -> Maybe String
(+++) (Just a) (Just b) = Just $ a ++ "\n\n" ++ b
(+++) _        _        = Nothing

line mode text ext = replHelp +++ editHelp +++ optionsHelp +++ commentHelp +++ executorsHelp +++ makersHelp +++ testersHelp +++ debuggersHelp
    where replHelp      = Repl.help ext
          editHelp      = Edit.help text ext
          optionsHelp   = Options.help ext
          commentHelp   = Comment.help          text ext
          executorsHelp = Executors.help (executeMode mode) text ext
          makersHelp    = Makers.help (makeMode mode)    text ext
          testersHelp   = Testers.help (testMode mode)    text ext
          debuggersHelp = Debuggers.help (debugMode mode) text ext


main = do
    let mode = createMode "0000"
    let ext = "hs"
    let text = "pete"

    print $ line mode text ext

    let mode = createMode "0000"
    let ext = "invalid"
    let text = "pete"

    print $ line mode text ext
