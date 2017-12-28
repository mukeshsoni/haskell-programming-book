import Data.Monoid
import Control.Monad
import Test.QuickCheck

monoidAssoc :: (Eq a, Monoid a) => a -> a -> a -> Bool
monoidAssoc a b c = a <> (b <> c) == (a <> b) <> c

monoidLeftIdentity :: (Eq a, Monoid a) => a -> Bool
monoidLeftIdentity a = mempty <> a == a

monoidRightIdentity :: (Eq a, Monoid a) => a -> Bool
monoidRightIdentity a = a <> mempty == a

data Optional a = Nada | Only a deriving (Eq, Show)

newtype First' a =
    First' {getFirst' :: Optional a}
    deriving (Eq, Show)

instance Monoid (First' a) where
    mempty = First' Nada
    mappend (First' Nada) (First' Nada) = First' Nada
    mappend (First' (Only a)) (First' _) = First' (Only a)
    mappend (First' Nada) (First' (Only a)) = First' (Only a)

instance Arbitrary a => Arbitrary (First' a) where
    arbitrary = do
        x <- arbitrary
        oneof [return (First' (Only x)), return (First' Nada)]

type FirstMappend =
       First' String
    -> First' String
    -> First' String
    -> Bool

type FstId = First' String -> Bool

main = do
    quickCheck (monoidAssoc :: FirstMappend)
    quickCheck (monoidLeftIdentity :: FstId)
    quickCheck (monoidRightIdentity :: FstId)