import Data.Monoid

data List a = 
    Nil
  | Cons a (List a)
  deriving (Eq, Show)

append :: List a -> List a -> List a
append Nil l2 = l2
append l1 Nil = l1
append (Cons a xs1) l2 = Cons a (append xs1 l2)

fold :: (a -> b -> b) -> b -> List a -> b
fold _ b Nil = b
fold f b (Cons a xs) = f a (fold f b xs) 

concat' :: List (List a) -> List a
concat' = fold append Nil

instance Monoid (List a) where
    mempty = Nil
    mappend = append

instance Functor List where
    fmap f Nil = Nil
    fmap f (Cons a xs) = Cons (f a) (fmap f xs)

flatMap :: (a -> List b) -> List a -> List b
flatMap f l = concat' $ fmap f l

-- Anything which involves recursive implementation takes me some time to think
-- :grimacing:
-- The implementation here is
-- Take each function in the first List
-- fmap them over the second list
-- append the list with the result of applicative (<*>) application of rest of the functions in 
    -- first list to the second list
instance Applicative List where
    pure a = Cons a Nil
    (<*>) Nil _ = Nil
    (<*>) _ Nil = Nil
    (<*>) (Cons fn xsFn) l = fmap fn l <> (xsFn <*> l)