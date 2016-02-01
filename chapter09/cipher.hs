module Cipher where

import Data.Char

ceaser :: String -> Int -> String
ceaser [] _ = []
ceaser (x:xs) n = shift x n : ceaser xs n

shift :: Char -> Int -> Char
shift x n
    | isUpper x = chr $ ((ord x - ord 'A' + n) `mod` 26) + ord 'A'
    | otherwise = chr $ ((ord x - ord 'a' + n) `mod` 26) + ord 'a'

unCeaser :: String -> Int -> String
unCeaser l n = ceaser l (-n)
