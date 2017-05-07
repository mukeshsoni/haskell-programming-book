import Test.QuickCheck
import Data.Semigroup
import SemigroupLaws

data Three a b c = Three a b c deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c) => Semigroup (Three a b c) where
    (Three a b c) <> (Three x y z) = Three (a <> x) (b <> y) (c <> z)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        return (Three a b c)

type TwoAssoc a b c = Three a b c -> Three a b c -> Three a b c -> Bool

main = quickCheck (assocLaw :: TwoAssoc String String String)
