import System.Environment(getArgs)

import Mode
import Debug

dispath ext command modeString text
    | command == "Debug"     = Debug.debug (debugMode mode) ext text
    | command == "DebugHelp" = Debug.help  (debugMode mode) ext
    where mode = createMode modeString

main = do
    putStrLn $ dispath "hs" "Debug"     "0000" "pete"
    putStrLn $ dispath "hs" "DebugHelp" "0000" "pete"

    putStrLn ""

    putStrLn $ dispath "php" "Debug"     "0000" "pete"
    putStrLn $ dispath "php" "DebugHelp" "0000" "pete"

    putStrLn ""

    putStrLn $ dispath "php" "Debug"     "0001" "pete"
    putStrLn $ dispath "php" "DebugHelp" "0001" "pete"
