import Mode
import Repl
import Edit
import Options
import Comment
import Executors
import Makers
import Testers
import Debuggers


(+++) a b = a ++ "\n\n" ++ b

show_help mode text ext = replHelp +++ editHelp +++ optionsHelp +++ commentHelp +++ executorsHelp +++ makersHelp +++ testersHelp +++ debuggersHelp
    where replHelp      = Repl.help ext
          editHelp      = Edit.help text ext
          optionsHelp   = Options.help ext
          commentHelp   = Comment.help          text ext
          executorsHelp = Executors.help (executeMode mode) ext
          makersHelp    = Makers.help (makeMode mode)    ext
          testersHelp   = Testers.help (testMode mode)    ext
          debuggersHelp = Debuggers.help (debugMode mode) ext


main = do
    let mode = createMode "0000"
    let ext = "hs"
    let text = "pete"

    putStr $ show_help mode text ext
