import Data.Monoid
import Test.QuickCheck (quickCheck, Arbitrary, arbitrary)
import MonoidLaws

data Two a b = Two a b deriving (Eq, Show)

instance (Monoid a, Monoid b) => Monoid (Two a b) where
    mempty = Two mempty mempty
    mappend (Two a b) (Two x y) = Two (a <> x) (b <> y)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        return (Two a b)

main = do
    quickCheck (monoidAssoc :: (Two String String -> Two String String -> Two String String -> Bool))
    quickCheck (monoidLeftIdentity :: (Two String String -> Bool))
    quickCheck (monoidRightIdentity :: (Two String String -> Bool))