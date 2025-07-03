module Main where
 
import Control.Category ((>>>))
-- import qualified Data.ByteString.Char8 as BS
 
-- solve :: BS.ByteString -> BS.ByteString
-- solve s = if l > 10 then BS.take 1 s <> (BS.pack . show $ l - 2) <> BS.drop (l-1) s else s
--     where l = BS.length s
--
-- main = BS.interact $ BS.lines >>> drop 1 >>> map solve >>> BS.unlines
--
solve :: String -> String
solve s = if l > 10 then take 1 s <> show (l - 2) <> drop (l-1) s else s
   where l = length s
 
main = interact $ lines >>> drop 1 >>> map solve >>> unlines
