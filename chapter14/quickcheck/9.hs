{-# LANGUAGE FlexibleContexts #-}
-- to run the tests, simply do this on the terminal 
-- $ runhaskell <file_name>
-- You can also start a `ghci` session, load this file (:l) and then run main
import Test.QuickCheck

withFoldr = foldr (:)
withoutFoldr = (++)

prop_withWithoutFoldr init xs = (withFoldr init xs) == (withoutFoldr init xs)
-- quickCheck should show that the two are not equivalent
-- The failing case was [0] and [1]. withFoldr returns [1, 0] whereas
-- withoutFoldr returns [0, 1]

-- TODO - can't seem to get the below one working :(
withFoldr' :: (Foldable t) => t [a] -> [a]
withFoldr' = foldr (++) []
withoutFoldr' :: (Foldable t) => t [a] -> [a]
withoutFoldr' = concat
prop_withWithoutFoldr' xs = (withFoldr xs) == (withoutFoldr xs)

main = do
    quickCheck (prop_withWithoutFoldr :: [Int] -> [Int] -> Bool)
    -- quickCheck (prop_withWithoutFoldr' :: [[Int]] -> Bool)
