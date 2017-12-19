-- to run the tests, simply do this on the terminal 
-- $ runhaskell <file_name>
-- You can also start a `ghci` session, load this file (:l) and then run main
import Test.QuickCheck

f n xs = length (take n xs) == n

-- the above function does not hold. Fails for `f -1 []`
-- What about positive integers only?
main = do
    quickCheck (f :: Int -> [Int] -> Bool)