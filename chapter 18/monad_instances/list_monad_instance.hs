module MyList where

import Data.Monoid
-- TODO - write quickcheck laws using checkers library
data List a =
    Nil
  | Cons a (List a)
  deriving (Eq, Show)

append l1 Nil = l1
append Nil l2 = l2
append (Cons a xs1) l2 = Cons a (append xs1 l2)

instance Monoid (List a) where
    mempty = Nil
    mappend = append

instance Functor List where
    fmap f Nil = Nil
    fmap f (Cons a l) = Cons (f a) (fmap f l)

instance Applicative List where
    pure a = Cons a Nil
    (<*>) Nil l = Nil
    (<*>) _ Nil = Nil
    (<*>) (Cons f fns) l = mappend (fmap f l) ((<*>) fns l)

instance Monad List where
    return = pure
    (>>=) Nil _ = Nil
    (>>=) (Cons a xs) f = f a `mappend` (xs >>= f)