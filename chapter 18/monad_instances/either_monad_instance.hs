data Optional e a =
    Nope e
  | Yes a
  deriving (Eq, Show)

instance Functor (Optional e) where
    fmap _ (Nope e) = Nope e
    fmap f (Yes a) = Yes (f a)

instance Applicative (Optional e) where
    pure = Yes
    (<*>) (Nope e) _ = Nope e
    (<*>) _ (Nope e) = Nope e
    (<*>) (Yes f) (Yes a) = Yes (f a)

instance Monad (Optional e) where
    return = Yes
    (>>=) (Nope e) _ = Nope e
    (>>=) (Yes a) f = f a