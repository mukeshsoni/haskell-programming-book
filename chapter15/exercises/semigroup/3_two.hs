import Test.QuickCheck
import Data.Semigroup
import SemigroupLaws

data Two a b = Two a b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
    (Two a b) <> (Two x y) = Two (a <> x) (b <> y)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        return (Two a b)

type TwoAssoc a b = Two a b -> Two a b -> Two a b -> Bool

main = quickCheck (assocLaw :: TwoAssoc String String)
