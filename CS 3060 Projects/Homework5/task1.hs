module Main where

main = do
    print("What is your name?")
    name <- getLine
    print("Hello, " ++ name ++ ", you are good.")
