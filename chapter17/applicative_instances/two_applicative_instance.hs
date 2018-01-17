import Data.Monoid

data Two a b = Two a b deriving (Eq, Show)

instance Functor (Two a) where
    fmap f (Two a b) = Two a (f b)

instance (Monoid a) => Applicative (Two a) where
    pure = Two mempty
    (<*>) (Two x f) (Two y b) = Two (x <> y) (f b)