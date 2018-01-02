import Data.Monoid
import Test.QuickCheck (quickCheck, Arbitrary, arbitrary)
import MonoidLaws

data Trivial = Trivial deriving (Eq, Show)

instance Monoid Trivial where
    mempty = Trivial
    mappend _ _ = Trivial

instance Arbitrary Trivial where
    arbitrary = return Trivial

main = do
    quickCheck (monoidAssoc :: (Trivial -> Trivial -> Trivial -> Bool))
    quickCheck (monoidLeftIdentity :: (Trivial -> Bool))
    quickCheck (monoidRightIdentity :: (Trivial -> Bool))