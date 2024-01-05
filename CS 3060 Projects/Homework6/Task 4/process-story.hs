import System.IO
import Data.Char

lowerString str = [ toLower loweredString | loweredString <- str]

main :: IO Int
main = do
    handle <- openFile "story1.txt" ReadMode
    contents <- hGetContents handle
    let all_words_raw = words contents
    let all_words = map lowerString all_words_raw
    putStrLn("Story 1: printing stats below") 
    -- add relevent code below
    return 0
