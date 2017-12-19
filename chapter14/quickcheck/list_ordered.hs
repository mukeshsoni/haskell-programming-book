-- to run the tests, simply do this on the terminal 
-- $ runhaskell <file_name>
-- You can also start a `ghci` session, load this file (:l) and then run main
import Test.QuickCheck
import Data.List (sort)

listOrdered :: (Ord a) => [a] -> Bool
listOrdered xs = 
    snd $ foldr go (Nothing, True) xs
    where go _ status@(_, False) = status
          go y (Nothing, t) = (Just y, t)
          go y (Just x, t) = (Just y, x >= y)

propListOrdered :: (Ord a) => [a] -> Bool
propListOrdered xs = listOrdered (sort xs) == True

main = do
    quickCheck (propListOrdered :: [Int] -> Bool)
    quickCheck (propListOrdered :: String -> Bool)
