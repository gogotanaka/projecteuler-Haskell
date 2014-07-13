module Main where

--count_if p xs = foldl (\a x -> if p x then a + 1 else a) 0 xs

--tri_num n = sum [1..n]
--count_div n = count_if ((\x y -> x `mod` y == 0) n) [1..n]
--isDivCountLessThan m n = count_div n < m

--ans = dropWhile (isDivCountLessThan 500) [tri_num n | n <- [1..]] !! 0


import Data.List (group)

primes = 2 : filter ((==1).length.primeFactors) [3,5..]

primeFactors n = factor n primes
  where
    factor n (p:ps)
      | p * p > n      = [n]
      | n `mod` p == 0 = p : factor (n `div` p) (p:ps)
      | _      = factor n ps


ans = head $ filter ((> 500) . nDivisors) triangleNumbers
  where nDivisors n = product $ map ((+1).length) $　group (primeFactors n)
        triangleNumbers = scanl1 (+) [1..]


main = do { putStrLn $ show ans }
