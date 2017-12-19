-- to run the tests, simply do this on the terminal 
-- $ runhaskell <file_name>
-- You can also start a `ghci` session, load this file (:l) and then run main
import Test.QuickCheck

half x = x / 2

-- make it half and then multiply by two
halfIdentity :: Fractional a => a -> a
halfIdentity = (*2) . half

-- making a fractional number half and then multiplying by 2 should give back the same number
halfIdentityProp :: (Eq a, Fractional a) => a -> Bool
halfIdentityProp n = n == halfIdentity n

plusAssociative x y z = x + (y + z) == (x + y) + z
plusCommutative x y  = x + y == y + x
multiplyAssociative x y z = x * (y * z) == (x * y) * z
multiplyCommutative x y  = x * y == y * x

-- generator to generate positive integers
genPos :: Gen Int
genPos = abs `fmap` (arbitrary :: Gen Int) `suchThat` (> 0)

-- will fail if we don't use the `Positive a` type provided by quickcheck
-- will have divide by zero failures
quotRemProp :: Positive Int -> Positive Int -> Bool
quotRemProp (Positive x) (Positive y) = (quot x y) * y + (rem x y) == x

-- will fail if we don't use the `Positive a` type provided by quickcheck
-- will have divide by zero failures
divModProp :: Positive Int -> Positive Int -> Bool
divModProp (Positive x) (Positive y) = (div x y) * y + (mod x y) == x

main = do
    quickCheck (halfIdentityProp :: Float -> Bool)
    quickCheck (plusAssociative :: Int -> Int -> Int -> Bool)
    quickCheck (plusCommutative :: Int -> Int -> Bool)
    quickCheck (multiplyAssociative :: Int -> Int -> Int -> Bool)
    quickCheck (multiplyCommutative :: Int -> Int -> Bool)
    quickCheck quotRemProp 
    quickCheck divModProp 

