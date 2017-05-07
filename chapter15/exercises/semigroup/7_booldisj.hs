import Test.QuickCheck
import Data.Semigroup
import SemigroupLaws

newtype BoolDisj = BoolDisj Bool deriving (Eq, Show)

instance Semigroup BoolDisj where
    (BoolDisj False) <> (BoolDisj False) = BoolDisj False
    _ <> _ = BoolDisj True

instance Arbitrary BoolDisj where
    arbitrary = frequency [(1, return (BoolDisj True)), (1, return (BoolDisj False))]

type BoolConjAssoc = BoolDisj -> BoolDisj -> BoolDisj -> Bool

main = quickCheck (assocLaw :: BoolConjAssoc)

