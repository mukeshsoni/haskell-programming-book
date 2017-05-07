import Test.QuickCheck
import Data.Semigroup
import SemigroupLaws

data Four a b c d = Four a b c d deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c, Semigroup d) => Semigroup (Four a b c d) where
    (Four a b c d) <> (Four x y z i) = Four (a <> x) (b <> y) (c <> z) (d <> i)

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary (Four a b c d) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        c <- arbitrary
        d <- arbitrary
        return (Four a b c d)

type TwoAssoc a b c d = Four a b c d -> Four a b c d -> Four a b c d -> Bool

main = quickCheck (assocLaw :: TwoAssoc String String String String)

