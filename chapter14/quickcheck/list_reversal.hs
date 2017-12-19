-- to run the tests, simply do this on the terminal 
-- $ runhaskell <file_name>
-- You can also start a `ghci` session, load this file (:l) and then run main
import Test.QuickCheck

prop_listReversal xs = (reverse . reverse) xs == xs

main = do
    quickCheck (prop_listReversal :: String -> Bool)
    quickCheck (prop_listReversal :: [Int] -> Bool)
    quickCheck (prop_listReversal :: [String] -> Bool)