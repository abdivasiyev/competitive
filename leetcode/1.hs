module Main where

import qualified Data.Array as A

data Test = Test { items :: [Int], target :: Int}

tests :: [Test]
tests = [Test {items = [2, 7, 11, 15], target = 9}]

twoSum :: A.Array Int Int -> Int -> [Int]
twoSum xs target = A.indices xs

main = mapM_ print $ map (\test -> twoSum (A.listArray (1, length (items test)) (items test)) (target test)) tests
