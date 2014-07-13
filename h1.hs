--main :: IO ()
--main = do  putStrLn "Hello, World!"
--           putStrLn "Hello" >> putStrLn "World"

module Main where

ans = sum [x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]

main = do { putStrLn $ show ans }
