-- MainModule.hs
module Main where

filterMultiples :: [Int] -> [Int]
filterMultiples lst = filter (\x -> x `mod` 7 == 0 || x `mod` 5 == 0) lst

-- Example usage
exampleList :: [Int]
exampleList = [10, 42, 12, 35, 15, 70, 20]

exampleResult :: [Int]
exampleResult = filterMultiples exampleList


main = do putStrLn $ "Filtered List: " ++ show exampleResult

