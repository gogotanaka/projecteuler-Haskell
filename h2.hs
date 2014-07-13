-- takeWhile :: (a -> Bool) -> [a] -> [a]

module Main where

fbn1 n | n == 1    = 1
       | n == 2    = 1
       | otherwise = fbn1(n - 1) + fbn1(n - 2)

fbn2 1 = 1
fbn2 2 = 1
fbn2 n = fbn2(n - 1) + fbn2(n - 2)



fbns :: [Int]
fbns = [ x | x <- takeWhile  (<= 4000000) [ fbn1 x | x <- [1..] ], even x ]
ans :: Int
ans = sum fbns


--rans = sum [ x | x <- takeWhile (<= 4000000) fibs, even x]
--  where
--    fibs = 1 : 1 : zipWith (+) fibs (tail fibs)


main = do { putStrLn $ show ans }

