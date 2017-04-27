import Test.QuickCheck
import Lib

halfIdentity :: Fractional a => a -> a
halfIdentity = (*2) . half

prop_half :: (Eq a, Fractional a) => a -> Bool
prop_half n = 
    n == halfIdentity n

main :: IO ()
main = quickCheck (prop_half :: Float -> Bool)
