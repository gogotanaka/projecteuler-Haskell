module Main where

--divisions :: Int -> [Int] -> [Int]
--divisions n ary = fst $ span (division n) ary where
--  division a b = a `mod` b == 0

ans = foldl (\ary n -> filter ((\ n m -> (m `mod` n /= 0 && m /= n)) n) ary) [1..1000] [2..3]

main = do { putStrLn $ show ans }

