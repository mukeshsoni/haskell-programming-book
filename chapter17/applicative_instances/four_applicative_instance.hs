import Data.Monoid

data Four a b c d = Four a b c d deriving (Eq, Show)

instance Functor (Four a b c) where
    fmap f (Four a b c d) = Four a b c (f d)

instance (Monoid a, Monoid b, Monoid c) => Applicative (Four a b c) where
    pure = Four mempty mempty mempty
    (<*>) (Four a b c fn) (Four d e f x) = Four (a <> d) (b <> e) (c <> f) (fn x)