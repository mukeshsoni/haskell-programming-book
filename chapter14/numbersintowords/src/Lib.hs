module Lib where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n = 
    case n of
        0 -> "Zero"
        1 -> "One"
        2 -> "Two"
        3 -> "Three"
        4 -> "Four"
        5 -> "Five"
        6 -> "Six"
        7 -> "Seven"
        8 -> "Eight"
        9 -> "Nine"
        otherwise -> "Only single digits supported"

digits :: Int -> [Int]
digits n = go n []
    where
        go n xs
            | n < 10 = n : xs
            | otherwise = go (div n 10) ((mod n 10) : xs)

wordNumber :: Int -> String 
wordNumber = concat . (intersperse "-") . (map digitToWord) . digits
