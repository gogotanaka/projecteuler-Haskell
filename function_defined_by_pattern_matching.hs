module Main where

-- Function defined by pattern matching
filter' :: (a -> Bool) -> [a] -> [a]
filter' p (x:xs)
		| p x       = x : filter p xs
		| otherwise = filter p xs


-- This cause error
--member' :: a -> [a] -> Bool
--member' x []                 = False
--member' x (y:ys) | x==y      = True
--                 | otherwise = member' x ys

-- Works for any type a provided a is an instance of Eq
-- Works for any type a that supports the Eq operations
member' :: Eq a => a -> [a] -> Bool
member' x []                 = False
member' x (y:ys) | x==y      = True
                 | otherwise = member' x ys

-- 「型 a がクラス Eq のインスタンスであるのは、(多重定義された) (==), (/=) が存 在し、そのうえで定義された適切な型をもつ場合である」
--class Eq a where
--  (==), (/=) :: a -> a -> Bool
  
--  x == y = not (x /= y)
--  x /= y = not (x == y)


--data Point = Pt Double Double

--instance Eq Point where
--  (Pt x y) == (Pt x' y') = x == x' && y == y'

--main = do print $ (Pt 1 2) == (Pt 2 3)  -- 出力: False
--          print $ (Pt 1 2) /= (Pt 2 3)  -- 出力: True
--          print $ (Pt 1 2) == (Pt 1 2)  -- 出力: True



main = do putStrLn $ show $ filter (> 2) [1..8] !! 0
          putStrLn $ show $ member' 3 [2..10]