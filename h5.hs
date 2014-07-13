module Main where


-- map ((\x y -> x `mod` y == 0) 2520) [1..10]

-- ans = foldl (\ary n -> filter ((\x y -> y `mod` x == 0) n) ary) [20, 40..] [2..20]

foldr1 lcm [1..20]

main = do { putStrLn $ show (ans !! 0) }
