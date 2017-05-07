import Test.QuickCheck
import Data.Semigroup
import SemigroupLaws

data Or a b = Fst a | Snd b deriving (Eq, Show)

instance Semigroup (Or a b) where
    (Snd a) <> _ = Snd a
    _ <> (Snd b) = Snd b
    (Fst a) <> (Fst b) = Fst b

instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
    arbitrary =
        frequency [(1, fmap Fst arbitrary), (2, fmap Snd arbitrary)]

type OrAssoc a b = Or a b -> Or a b -> Or a b -> Bool

main = quickCheck (assocLaw :: OrAssoc String String)
        
