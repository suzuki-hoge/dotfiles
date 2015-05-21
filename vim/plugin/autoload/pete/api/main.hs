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
    putStrLn $ dispath "Debug"     "0000" "pete" "hs"
    putStrLn $ dispath "DebugHelp" "0000" "pete" "hs"
