module Main where

factorial n
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)

main = do putStrLn "What is 5! ?"
          x <- readLn
          if x == factorial 5
          then putStrLn "You're right!"
          else putStrLn "You're wrong!"
