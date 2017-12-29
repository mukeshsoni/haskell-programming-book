import Test.QuickCheck (arbitrary, Arbitrary, quickCheck, oneof)
import Data.Semigroup (Semigroup, (<>))
import SemigroupLaws 

data Validation a b =
    Failure a | Success b
    deriving (Eq, Show)

newtype AccumulateRight a b =
    AccumulateRight (Validation a b)
    deriving (Eq, Show)

instance Semigroup a =>
    Semigroup (AccumulateRight a b) where
        (AccumulateRight (Success _)) <> (AccumulateRight (Success b)) = AccumulateRight (Success b)
        (AccumulateRight (Failure _)) <> (AccumulateRight (Failure b)) = AccumulateRight (Failure b)
        (AccumulateRight (Failure a)) <> (AccumulateRight (Success _)) = AccumulateRight (Failure a)
        (AccumulateRight (Success _)) <> (AccumulateRight (Failure b)) = AccumulateRight (Failure b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (AccumulateRight a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        oneof [return (AccumulateRight (Success x)), return (AccumulateRight (Failure y))]

type ValidationAssoc = AccumulateRight String String -> AccumulateRight String String -> AccumulateRight String String -> Bool
type ValidationAssoc2 = AccumulateRight String Integer -> AccumulateRight String Integer -> AccumulateRight String Integer -> Bool

main = do
    quickCheck (assocLaw :: ValidationAssoc)
    quickCheck (assocLaw :: ValidationAssoc2)