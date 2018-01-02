import Data.Monoid
import Test.QuickCheck (quickCheck, Arbitrary, arbitrary)
import MonoidLaws

newtype BoolConj = BoolConj Bool deriving (Eq, Show)

instance Monoid BoolConj where
    mempty = BoolConj True
    mappend (BoolConj False) _ = BoolConj False
    mappend _ (BoolConj False) = BoolConj False
    mappend _ _ = BoolConj True

instance Arbitrary BoolConj where
    arbitrary = fmap BoolConj arbitrary

main = do
    quickCheck (monoidAssoc :: (BoolConj -> BoolConj -> BoolConj -> Bool))
    quickCheck (monoidLeftIdentity :: (BoolConj -> Bool))
    quickCheck (monoidRightIdentity :: (BoolConj -> Bool))