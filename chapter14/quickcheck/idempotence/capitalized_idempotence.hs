-- to run the tests, simply do this on the terminal 
-- $ runhaskell <file_name>
-- You can also start a `ghci` session, load this file (:l) and then run main
import Test.QuickCheck
import Data.Char (toUpper)

twice f = f . f
fourTimes = twice . twice

capitalized :: String -> String
capitalized [] = []
capitalized (x: xs) = (toUpper x) : xs

prop_idempotenceSort x = (capitalized x == twice capitalized x) && (capitalized x == fourTimes capitalized x)

main = do
    quickCheck (prop_idempotenceSort :: String -> Bool)
