module Main where

possibleStringCount :: String -> Int
possibleStringCount s = go s 1 0
    where go [] res acc = res + acc
          go (x:y:xs) res acc = if x == y then go (y:xs) res (acc+1) else go (y:xs) (res+acc) 0
          go (x:xs) res acc = res + acc

main = print $ possibleStringCount "aabbcc"
