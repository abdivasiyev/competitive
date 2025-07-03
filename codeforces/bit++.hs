module Main where

import Control.Category ((>>>))

data Stmt = Incr | Decr deriving (Show)

stmt :: String -> Stmt
stmt s | '+' `elem` s = Incr
       | '-' `elem` s = Decr

eval :: [Stmt] -> Int
eval xs = go xs 0
   where go [] acc = acc
         go (y:ys) acc = case y of
             Incr -> go ys (acc+1)
             Decr -> go ys (acc-1)

main = interact $
   lines >>> drop 1 >>> map stmt >>> eval >>> show
