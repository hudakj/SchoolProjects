module Main where

toDigitList :: Int -> [Int]     -- want to take in an integer and output a list of integers. 
toDigitList n
  | n < 0     = []              -- If n is negative, return an empty list
  | n == 0    = [0]             -- If n is zero, return a list containing 0
  | otherwise = toDigitList' (abs n)  -- Otherwise, convert the absolute value of n to a list

-- Recursive function to convert an absolute value of n to a list of digits
toDigitList' :: Int -> [Int]
toDigitList' 0 = []             -- Base case: When n becomes 0, return an empty list
toDigitList' m = toDigitList' (m `div` 10) ++ [m `mod` 10]  -- Recursive case: Break down n into digits


main = do
  print (toDigitList 1354)      -- Output: [1,3,5,4]
  print (toDigitList 0)         -- Output: [0]
  print (toDigitList (-52))     -- Output: []
