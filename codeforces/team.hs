module Main where
 
import Control.Category ((>>>))
 
satisfy :: [Int] -> Bool
satisfy xs = (length . filter (>0) $ xs) >= 2
 
solve :: [[Int]] -> Int
solve = length . filter id . map satisfy
 
main = interact $
    lines >>> map (words >>> map read) >>> solve >>> show
