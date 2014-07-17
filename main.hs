module Main where

import Data.List (group)
------ Q1 ------

a1 = sum [x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]

------ Q2 ------

--fbn n | n == 1    = 1
--      | n == 2    = 1
--      | otherwise = fbn(n - 1) + fbn(n - 2)
--fbns :: [Int]
--fbns = [ x | x <- takeWhile  (<= 4000000) [ fbn x | x <- [1..] ], even x ]
--a2 :: Int
--a2 = sum fbns

a2 = sum [ x | x <- takeWhile (<= 4000000) fibs, even x]
  where
    fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

------ Q3 ------

-- a3 = foldl (\ary n -> filter ((\ n m -> (m `mod` n /= 0 && m /= n)) n) ary) [1..1000] [2..3]

--divisions :: Int -> [Int] -> [Int]
--divisions n ary = fst $ span (division n) ary where
--  division a b = a `mod` b == 0

------ Q5 ------

-- map ((\x y -> x `mod` y == 0) 2520) [1..10]

-- a5 = foldl (\ary n -> filter ((\x y -> y `mod` x == 0) n) ary) [20, 40..] [2..20] !! 0

a5 = foldr1 lcm [1..20]

------ Q6 ------

a6 = (sum [1..100] ^ 2) - sum (map (^ 2) [1..100])

------ Q11 ------

--count_if p xs = foldl (\a x -> if p x then a + 1 else a) 0 xs

--tri_num n = sum [1..n]
--count_div n = count_if ((\x y -> x `mod` y == 0) n) [1..n]
--isDivCountLessThan m n = count_div n < m

--a11 = dropWhile (isDivCountLessThan 500) [tri_num n | n <- [1..]] !! 0



primes = 2 : filter ((==1).length.primeFactors) [3,5..]

primeFactors n = factor n primes
  where
    factor n (p:ps)
      | p * p > n      = [n]
      | n `mod` p == 0 = p : factor (n `div` p) (p:ps)
      | otherwise      = factor n ps


a11 = head $ filter ((> 500) . nDivisors) triangleNumbers
  where nDivisors n = product $ map ((+1).length) $　group (primeFactors n)
        triangleNumbers = scanl1 (+) [1..]

main = do putStrLn $ "Answer to #1 is " ++ show a1
          putStrLn $ "Answer to #2 is " ++ show a2
          putStrLn $ "Answer to #5 is " ++ show a5
          putStrLn $ "Answer to #6 is " ++ show a6
          putStrLn $ "Answer to #11 is " ++ show a11
