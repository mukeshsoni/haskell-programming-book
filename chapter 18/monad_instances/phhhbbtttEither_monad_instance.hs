-- TODO - write quickcheck laws using checkers library
data PhhhbbtttEither b a =
    Left' a
  | Right' b

instance Functor (PhhhbbtttEither b) where
    fmap f (Right' b) = Right' b
    fmap f (Left' a) = Left' (f a)

instance Applicative (PhhhbbtttEither b) where
    pure = Left'
    (<*>) (Right' x) _ = Right' x
    (<*>) _ (Right' x) = Right' x
    (<*>) (Left' f) (Left' a) = Left' (f a)

instance Monad (PhhhbbtttEither b) where
    return = pure
    (>>=) (Right' x) _ = Right' x
    (>>=) (Left' a) f = f a