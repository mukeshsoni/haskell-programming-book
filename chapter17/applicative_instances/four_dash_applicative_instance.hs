import Data.Monoid

data Four' a b = Four' a a a b deriving (Eq, Show)

instance Functor (Four' a) where
    fmap f (Four' a b c d) = Four' a b c (f d)

instance (Monoid a) => Applicative (Four' a) where
    pure = Four' mempty mempty mempty
    (<*>) (Four' a b c fn) (Four' d e f x) = Four' (a <> d) (b <> e) (c <> f) (fn x)