import Control.Applicative
import System.Environment(getArgs)

import Mode
import Debug

-- 各ヘルプはここで
-- HコマンドはHelp.hsで
-- テスト作る
-- 行間や順番
-- 型注釈
dispath command modeString text ext
    | command == "Debug"     = Debug.get  (debugMode mode) text ext
    | command == "DebugHelp" = Debug.help (debugMode mode) ext
    where mode = createMode modeString

main = do
    command    <- (!! 0) <$> getArgs
    modeString <- (!! 1) <$> getArgs
    text       <- (!! 2) <$> getArgs
    ext        <- (!! 3) <$> getArgs

    putStr $ dispath command modeString text ext
