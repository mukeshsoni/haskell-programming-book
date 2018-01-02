import Data.Monoid
import Test.QuickCheck (quickCheck, Arbitrary, arbitrary)
import MonoidLaws

data Identity a = Identity a deriving (Eq, Show)

instance (Monoid a) => Monoid (Identity a) where
    mempty = Identity mempty
    mappend (Identity a) (Identity b) = Identity (a <> b)

instance (Arbitrary a) => Arbitrary (Identity a) where
    arbitrary = fmap Identity arbitrary

main = do
    quickCheck (monoidAssoc :: (Identity String -> Identity String -> Identity String -> Bool))
    quickCheck (monoidLeftIdentity :: (Identity String -> Bool))
    quickCheck (monoidRightIdentity :: (Identity String -> Bool))