import Test.QuickCheck (arbitrary, Arbitrary, quickCheck, oneof)
import Data.Semigroup (Semigroup, (<>))
import SemigroupLaws 

data Validation a b =
    Failure a | Success b
    deriving (Eq, Show)

newtype AccumulateBoth a b =
    AccumulateBoth (Validation a b)
    deriving (Eq, Show)

instance (Semigroup a, Semigroup b) =>
    Semigroup (AccumulateBoth a b) where
        (AccumulateBoth (Success a)) <> (AccumulateBoth (Success b)) = AccumulateBoth (Success (a <> b))
        (AccumulateBoth (Failure a)) <> (AccumulateBoth (Failure b)) = AccumulateBoth (Failure (a <> b))
        (AccumulateBoth (Failure a)) <> (AccumulateBoth (Success _)) = AccumulateBoth (Failure a)
        (AccumulateBoth (Success _)) <> (AccumulateBoth (Failure b)) = AccumulateBoth (Failure b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (AccumulateBoth a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        oneof [return (AccumulateBoth (Success x)), return (AccumulateBoth (Failure y))]

type ValidationAssoc = AccumulateBoth String String -> AccumulateBoth String String -> AccumulateBoth String String -> Bool

main = quickCheck (assocLaw :: ValidationAssoc)