import Data.Monoid

data Three a b c = Three a b c deriving (Eq, Show)

instance Functor (Three a b) where
    fmap f (Three a b c) = Three a b (f c)

instance (Monoid a, Monoid b) => Applicative (Three a b) where
    pure = Three mempty mempty
    (<*>) (Three a b f) (Three c d x) = Three (a <> c) (b <> d) (f x)