module Main where

import Control.Category ((>>>))

main = interact $
    lines >>> map (read >>> solve) >>> head

solve :: Int -> String
solve n | n == 2         = "NO"
        | n `mod` 2 == 0 = "YES"
        | otherwise      = "NO"
