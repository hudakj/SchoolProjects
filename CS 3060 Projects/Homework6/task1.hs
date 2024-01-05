module Main where

import System.IO

main :: IO ()
main = do
    putStrLn "Choose a function to run:"
    putStrLn "a) bar"
    putStrLn "b) digitCount"
    putStrLn "c) foo"
    
    choice <- getLine
    
    case choice of
        "a" -> runBar
        "b" -> runDigitCount
        "c" -> runFoo
        _   -> putStrLn "Invalid choice. Please enter 'a', 'b', or 'c.'"

-- (a) Function bar
bar :: Int -> Int -> Int -> (Int, Int)
bar x y z = (sumOdd x y, sumEven y z)
  where
    sumOdd a b = foldl (\acc n -> if odd n && n > a && n < b then acc + n else acc) 0 [a..(b-1)]
    sumEven a b = foldl (\acc n -> if even n && n > a && n < b then acc + n else acc) 0 [a..(b-1)]

-- (b) Function digitCount
digitCount :: Int -> (Int, Int)
digitCount num = foldl countDigits (0, 0) (show (abs num))
  where
    countDigits (oddCount, evenCount) digit =
      if even (read [digit] :: Int)
        then (oddCount, evenCount + 1)
        else (oddCount + 1, evenCount)

-- (c) Function foo
foo :: [Int] -> Int
foo nums = length $ filter (\n -> length (show (abs n)) > 2 && length (show (abs n)) < 5) nums

-- Functions to run chosen methods
runBar :: IO ()
runBar = do
    putStrLn "Enter three integers (x, y, z) separated by spaces:"
    input <- getLine
    let [x, y, z] = map read (words input)
    let result = bar x y z
    putStrLn $ "Result of bar: " ++ show result

runDigitCount :: IO ()
runDigitCount = do
    putStrLn "Enter an integer:"
    input <- getLine
    let num = read input
    let result = digitCount num
    putStrLn $ "Result of digitCount: " ++ show result

runFoo :: IO ()
runFoo = do
    putStrLn "Enter a list of integers separated by spaces:"
    input <- getLine
    let nums = map read (words input)
    let result = foo nums
    putStrLn $ "Result of foo: " ++ show result
