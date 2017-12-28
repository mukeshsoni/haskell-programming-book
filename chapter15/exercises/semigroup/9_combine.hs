-- TODO - couldn't figure out this exercise
import Test.QuickCheck
import Data.Semigroup
import SemigroupLaws

newtype Combine a b =
    Combine {unCombine :: a -> b}

instance Semigroup b => Semigroup (Combine a b) where
    (Combine f) <> (Combine g) = Combine (f <> g)