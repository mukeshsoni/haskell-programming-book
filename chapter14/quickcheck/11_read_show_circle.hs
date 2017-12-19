-- to run the tests, simply do this on the terminal 
-- $ runhaskell <file_name>
-- You can also start a `ghci` session, load this file (:l) and then run main
import Test.QuickCheck

f x = (read (show x)) == x

main = do
    quickCheck (f :: Int -> Bool)
    quickCheck (f :: String -> Bool)
    quickCheck (f :: [String] -> Bool)