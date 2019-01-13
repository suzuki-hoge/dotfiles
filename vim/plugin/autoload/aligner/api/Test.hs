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
    -- , to |
    test "," " | " "\
    \id, name, age\n\
    \1,John Doe,39" "\
    \id | name     | age\n\
    \1  | John Doe | 39 "

    -- back-quote and back-slash
    test "," " | " "\
    \a, b, c\n\
    \`ls`,'foo\\tbar',c" "\
    \a    | b          | c\n\
    \`ls` | 'foo\\tbar' | c"

    -- keep indent
    test "=" " = " "\
    \    id = 1\n\
    \    name = 'John'" "\
    \    id   = 1     \n\
    \    name = 'John'"

    -- | to ,
    test "|" ", " "\
    \id | name     | age\n\
    \1  | John Doe | 39 " "\
    \id, name    , age\n\
    \1 , John Doe, 39 "

    -- 日本語
    test "|" ", " "\
    \id|name|c\n\
    \1|John Doe|c\n\
    \2|太郎|c" "\
    \id, name    , c\n\
    \1 , John Doe, c\n\
    \2 , 太郎    , c"
