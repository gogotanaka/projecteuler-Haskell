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
module Main where

factorial n = if n == 0 then 1 else n * factorial (n - 1)

main = do putStrLn "What is 5! ?"
          x <- readLn
          if x == factorial 5
              then putStrLn "You're right!"
              else putStrLn "You're wrong!"
