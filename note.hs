--コンパイル
--ghc --make Test.hs
--./Test

--インタプリンタ
--ghci

--ghci 上だと関数定義にletが必要

--無限リスト
[1 .. 5]
[1, 3 .. 10]

--文字列はcharのリスト
['H', 'e', 'l', 'l', 'o']

'C' : ['H', 'e', 'l', 'l', 'o']

--諸関数
zip [1 .. 5] ['a' .. 'e']
map (+ 2) [1 .. 5]
map fst [(1, 2), (3, 4), (5, 6)]
filter (> 2) [1 .. 5]
mod 9 2

--型

:t ['a' .. 'c']
:t [('x', True), ('y', False)]


--ラムダ式

 (\ x -> x 10)(\y -> y * 20)


--関数の帰納的定義
:{
let
  kaijou 0 = 1
  kaijou n = n * kaijou (n - 1)
:}
kaijou 5

lFunc a b = a^2 + b^2
rFunc a b = a+b+2
getAnsTo n = [(a,b)| a<-[-n..n], b<-[-n..n], lFunc a b == rFunc a b]


getAnsTo2 n =
    let
        lf a b = a^2 + b^2
        rf a b = a+b+2
    in [(a,b)| a<-[-n..n], b<-[-n..n], lf a b == rf a b]

getAnsTo3 n = [(a,b)| a<-[-n..n], b<-[-n..n], lf a b == rf a b]
    where
        lf a b = a^2 + b^2
        rf a b = a+b+2

[(x,y) | x <-[1..10], x `mod` 2 ==0 , y<-[1..10], y `mod` 2 /=0]

let rightTriangles = [(a, b, c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2, a + b + c == 24]
rightTriangles


# 型変数
:t fst
(output) fst :: (a, b) -> a

:t (==)
(output) (==) :: Eq a => a -> a -> Bool
#'Eq a =>' は型クラス制約と呼ばれる



addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

----------------------------------------
module Main where

factorial n
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)

main = do putStrLn "What is 5! ?"
          x <- readLn
          if x == factorial 5
          then putStrLn "You're right!"
          else putStrLn "You're wrong!"

----------------------------

main :: IO ()
main = do  putStrLn "Hello, World!"
           putStrLn "Hello" >> putStrLn "World"

fbn1 n | n == 1    = 1
       | n == 2    = 1
       | otherwise = fbn1(n - 1) + fbn1(n - 2)


fbn2 1 = 1
fbn2 2 = 1
fbn2 n = fbn2(n - 1) + fbn2(n - 2)

