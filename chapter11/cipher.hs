module Vignere where

import Data.Char

shift :: Char -> Int -> Char
shift x n
    | isUpper x = chr $ ((ord x - ord 'A' + n) `mod` 26) + ord 'A'
    | otherwise = chr $ ((ord x - ord 'a' + n) `mod` 26) + ord 'a'

vignere :: String -> String -> String
vignere l key = vignere' l key 0

findCeaserN :: String -> Int -> Char -> Int
findCeaserN key index baseChar = ord (key !! (index `mod` length key)) - ord baseChar

nextIndex :: Int -> Char -> Int
nextIndex currentIndex x = if x == ' ' then currentIndex else currentIndex + 1

vignere' :: String -> String -> Int -> String
vignere' [] _ _ = []
vignere' l [] _ = l
vignere' (x:xs) key index
    | isUpper (key !! (index `mod` length key)) =
        let n = findCeaserN key index 'A' in
            shift x n : vignere' xs key (nextIndex index x)
    | otherwise =
        let n = findCeaserN key index 'a' in
            shift x n : vignere' xs key (nextIndex index x)
