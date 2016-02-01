import Data.Char

capitalizeFirst [] = []
capitalizeFirst (x:xs) = toUpper x : xs

capitalizeAll [] = []
capitalizeAll (x:xs) = toUpper x : capitalizeAll xs

capitalizeAndReturnFirst :: String -> Char
capitalizeAndReturnFirst l = toUpper . head $ l
