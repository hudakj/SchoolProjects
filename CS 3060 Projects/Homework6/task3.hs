module Main where

-- (a) Define the Book data type
data Book = Book { title :: String, price :: Double, author :: String } deriving (Show, Eq)

-- Create books
book1 :: Book
book1 = Book "Great day" 290.2 "PC"

book2 :: Book
book2 = Book "To kill a mocking bird" 310.4 "HL"

book3 :: Book
book3 = Book "Fermat enigma" 297.3 "MS"

-- (b) Define the BookColln data type
type BookColln = [Book]

-- Create a collection of books
bookCollection :: BookColln
bookCollection = [book1, book2, book3]

-- (c) Write the contains function
contains :: Book -> BookColln -> Bool
contains b colln = b `elem` colln

-- Main function
main :: IO ()
main = do
    putStrLn "Objective (a): Create and show books"
    putStrLn $ "Book 1: " ++ show book1
    putStrLn $ "Book 2: " ++ show book2
    putStrLn $ "Book 3: " ++ show book3

    putStrLn "\nObjective (b): Create and show a collection of books"
    putStrLn $ "Book Collection: " ++ show bookCollection

    putStrLn "\nObjective (c): Test contains function"
    putStrLn $ "Does the collection contain book2? " ++ show (contains book2 bookCollection)
