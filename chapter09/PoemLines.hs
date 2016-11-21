module PoemLines where

firstSen = "Tyger Tyger, burning bright\n" 
secondSen = "In the forests of the night\n" 
thirdSen = "What immortal hand or eye\n" 
fourthSen = "Could frame thy fearful symmetry?" 
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

-- putStrLn sentences -- should print
-- Tyger Tyger, burning bright
-- In the forests of the night
-- What immortal hand or eye
-- Could frame thy fearful symmetry?
-- Implement this

myLines :: String -> [String] 
myLines = undefined

-- What we want 'myLines sentences' to equal
shouldEqual =
    [ "Tyger Tyger, burning bright"
    , "In the forests of the night"
    , "What immortal hand or eye"
    , "Could frame thy fearful symmetry?" ]

--Ans--
split'' s separator = go s []
  where
    go s l
      | length s == 0 = l
      | otherwise = go ((drop 1) $ dropWhile (/= separator) s) (l ++ [takeWhile (/= separator) s])