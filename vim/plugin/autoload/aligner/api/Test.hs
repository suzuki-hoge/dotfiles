import Fs

test :: Delim -> Delim -> String -> String -> IO ()
test orgDelim dstDelim input exp = do
    let act = fix orgDelim dstDelim (lines input)

    if act == exp
        then putStrLn "."
        else do
            putStrLn "act"
            putStrLn act
            putStrLn "exp"
            putStrLn exp

main :: IO ()
main = do
    test "," " | " "\
    \id, name, age\n\
    \1,John Doe,39" "\
    \id | name     | age\n\
    \1  | John Doe | 39 "

    test "," " | " "\
    \a, b, c\n\
    \`ls`,'foo\\tbar',c" "\
    \a    | b          | c\n\
    \`ls` | 'foo\\tbar' | c"
