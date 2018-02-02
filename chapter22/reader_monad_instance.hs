{-# LANGUAGE InstanceSigs #-}

newtype Reader r a =
    Reader { runReader :: r -> a }

instance Functor (Reader r) where
    fmap f (Reader rf) = Reader (f . rf)

instance Applicative (Reader r) where
    pure x = Reader $ const x
    (<*>) (Reader f) (Reader f2) =
        Reader (\x -> f x (f2 x))

instance Monad (Reader r) where
    return = pure
    (>>=) (Reader f1) f =
        Reader (\r -> (runReader $ f (f1 r)) r)