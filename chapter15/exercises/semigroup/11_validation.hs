import Test.QuickCheck (arbitrary, Arbitrary, quickCheck, oneof)
import Data.Semigroup (Semigroup, (<>))
import SemigroupLaws 

data Validation a b =
    Failure a | Success b
    deriving (Eq, Show)

instance Semigroup a =>
    Semigroup (Validation a b) where
        (Success a) <> (Success b) = Success b
        (Failure a) <> (Failure b) = Failure (a <> b)
        (Failure a) <> (Success b) = Failure a
        (Success a) <> (Failure b) = Failure b

instance (Arbitrary a, Arbitrary b) => Arbitrary (Validation a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        oneof [return (Success x), return (Failure y)]

type ValidationAssoc = Validation String String -> Validation String String -> Validation String String -> Bool
type ValidationAssoc2 = Validation String Integer -> Validation String Integer -> Validation String Integer -> Bool

main = do
    quickCheck (assocLaw :: ValidationAssoc)
    quickCheck (assocLaw :: ValidationAssoc2)