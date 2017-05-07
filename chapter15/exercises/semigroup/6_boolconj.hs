import Test.QuickCheck
import Data.Semigroup
import SemigroupLaws

newtype BoolConj = BoolConj Bool deriving (Eq, Show)

instance Semigroup BoolConj where
    (BoolConj True) <> (BoolConj True) = BoolConj True
    _ <> _ = BoolConj False

instance Arbitrary BoolConj where
    arbitrary = frequency [(1, return (BoolConj True)), (1, return (BoolConj False))]

type BoolConjAssoc = BoolConj -> BoolConj -> BoolConj -> Bool

main = quickCheck (assocLaw :: BoolConjAssoc)
