import Data.Monoid

data Three' a b = Three' a b b deriving (Eq, Show)

instance Functor (Three' a) where
    fmap f (Three' a b c) = Three' a (f b) (f b)

instance (Monoid a) => Applicative (Three' a) where
    pure x = Three' mempty x x
    (<*>) (Three' x f1 f2) (Three' y b1 b2) = Three' (x <> y) (f1 b1) (f2 b2)