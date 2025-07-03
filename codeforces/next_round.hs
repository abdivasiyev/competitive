{-# LANGUAGE LambdaCase #-}

module Main where

import Control.Monad (replicateM)
import Control.Monad.State
import Control.Category ((>>>))

type Scanner = State [String]

runScanner :: Scanner a -> String -> a
runScanner s = evalState s . words

str :: Scanner String
str = get >>= \case {s:ss -> put ss >> return s}

int :: Scanner Int
int = read <$> str

many :: Scanner a -> Scanner [a]
many s = get >>= \case { [] -> return []; _ -> (:) <$> s <*> many s }

data Input = Input {getN :: Int, getK :: Int, getScores :: [Int]}

input :: Scanner Input
input = Input
   <$> int
   <*> int
   <*> many int

solve :: Input -> Int
solve input = let k = getK input
                  kthScore = getScores input !! (k-1)
              in length . filter (\x -> x > 0 && x >= kthScore) $ getScores input

main = interact $
    runScanner input >>> solve >>> show
