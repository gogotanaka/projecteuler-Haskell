module Main where

ans = [(a, b, 1000 - a - b) | a <- [1..998], b <- [1..1000 - a]]

main = do { putStrLn $ show ans }
