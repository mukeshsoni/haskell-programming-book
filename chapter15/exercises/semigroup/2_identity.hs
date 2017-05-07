import Test.QuickCheck
import Data.Semigroup
import SemigroupLaws

newtype Identity a = Identity a deriving (Eq, Show)

instance Semigroup (Identity a) where
    leftIdentity <> _ = leftIdentity

instance Arbitrary a => Arbitrary (Identity a) where
    arbitrary = fmap Identity arbitrary 

type IdentityAssoc a = Identity a -> Identity a -> Identity a -> Bool

main = quickCheck (assocLaw :: IdentityAssoc String)
