import Data.Monoid

data List a = 
    Nil
  | Cons a (List a)
  deriving (Eq, Show)

instance Monoid (List a) where
    mempty = Nil
    mappend Nil l2 = l2
    mappend l1 Nil = l1
    mappend (Cons a xs1) l2 = Cons a (mappend xs1 l2)

instance Functor List where
    fmap f Nil = Nil
    fmap f (Cons a xs) = Cons (f a) (fmap f xs)

-- Anything which involves recursive implementation takes me some time to think
-- :grimacing:
-- The implementation here is
-- Take each function in the first List
-- fmap them over the second list
-- append the list with the result of applicative (<*>) application of rest of the functions in 
    -- first list to the second list
instance Applicative List where
    pure _ = Nil
    (<*>) Nil _ = Nil
    (<*>) _ Nil = Nil
    (<*>) (Cons fn xsFn) l = fmap fn l <> (xsFn <*> l)