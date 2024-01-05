module Main where

-- Function to check if a number is a perfect square
isPerfectSquare :: Int -> Bool
isPerfectSquare n = round (sqrt (fromInteger (toInteger n)))^2 == n

-- Function to count perfect squares in a list
countPerfectSquares :: [Int] -> Int
countPerfectSquares lst = length (filter isPerfectSquare lst)

main = do
    let lst = [42, 9, 70, 16, 625, 15, 300]
    print (countPerfectSquares lst)
