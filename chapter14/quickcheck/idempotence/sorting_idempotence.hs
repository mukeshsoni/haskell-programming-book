-- to run the tests, simply do this on the terminal 
-- $ runhaskell <file_name>
-- You can also start a `ghci` session, load this file (:l) and then run main
import Test.QuickCheck
import Data.List (sort)

twice f = f . f
fourTimes = twice . twice

prop_idempotenceSort x = (sort x == twice sort x) && (sort x == fourTimes sort x)

main = do
    quickCheck (prop_idempotenceSort :: [Int] -> Bool)