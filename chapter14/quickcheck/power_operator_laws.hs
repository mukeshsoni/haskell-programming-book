-- to run the tests, simply do this on the terminal 
-- $ runhaskell <file_name>
-- You can also start a `ghci` session, load this file (:l) and then run main
import Test.QuickCheck

prop_powerAssociativity x y z =
    x ^ (y ^ z) == (x ^ y) ^ z

prop_powerCommutative x y = x ^ y == y ^ x

-- below quick check tests will show, when run, that ^ operator is neither associative nor commutative
main = do
    quickCheck (prop_powerAssociativity :: Int -> Int -> Int -> Bool)
    quickCheck (prop_powerCommutative :: Int -> Int -> Bool)