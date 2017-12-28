module Lib where

import           Data.List (intercalate)


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
        _ -> "Only single digits supported"

digits :: Int -> [Int]
digits n = go n []
    where
        go num xs
            | num < 10 = num : xs
            | otherwise = go (div num 10) (mod num 10 : xs)

wordNumber :: Int -> String
wordNumber = intercalate "-" . map digitToWord . digits
