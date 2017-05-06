import Test.QuickCheck
import Lib

halfIdentity :: Fractional a => a -> a
halfIdentity = (*2) . half

prop_half :: (Eq a, Fractional a) => a -> Bool
prop_half n = 
    n == halfIdentity n

prop_plusAssociative x y z =
    x + (y + z) == (x + y) + z

prop_plusCommutative x y =
    x + y == y + x

prop_mulAssociative x y z = 
    x * (y * z) == (x * y) * z

prop_mulCommutative x y =
    x * y == y * x

prop_powerAssociative x y z =
    x ^ (y ^ z) == (x ^ y) ^ z

f :: (Num a) => [a] -> a
f [] = 1
f (x:xs) = 1

main :: IO ()
main = do
    quickCheck (prop_half :: Float -> Bool)
    quickCheck (prop_plusAssociative :: Int -> Int -> Int -> Bool)
    quickCheck (prop_plusCommutative :: Int -> Int -> Bool)
    quickCheck (prop_mulAssociative :: Int -> Int -> Int -> Bool)
    quickCheck (prop_mulCommutative :: Int -> Int -> Bool)
    quickCheck (prop_powerAssociative :: Int -> Int -> Int -> Bool)
