data Pair a = Pair a a deriving (Eq, Show)

instance Functor Pair where
    fmap f (Pair a b) = Pair (f a) (f b)

instance Applicative Pair where
    pure x = Pair x x
    (<*>) (Pair f1 f2) (Pair a b) = Pair (f1 a) (f2 b)