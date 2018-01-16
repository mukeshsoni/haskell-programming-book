module ZipList' where

import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Checkers
import Test.QuickCheck.Classes

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

take' :: Int -> List a -> List a
take' 0 l = Nil
take' n (Cons a xs) = Cons a (take' (n - 1) xs)
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

zipWith' :: (a -> b -> c) -> List a -> List b -> List c
zipWith' _ Nil _ = Nil
zipWith' _ _ Nil = Nil
zipWith' fn (Cons a xs) (Cons b ys) = Cons (fn a b) (zipWith' fn xs ys)

newtype ZipList' a =
    ZipList' (List a)
    deriving (Eq, Show)

instance Eq a => EqProp (ZipList' a) where
    xs =-= ys = xs' `eq` ys'
        where xs' = let (ZipList' l) = xs
                    in take' 3000 l
              ys' = let (ZipList' l) = ys
                    in take' 3000 l

instance Functor ZipList' where
    fmap f (ZipList' l) = ZipList' (fmap f l)

instance Applicative ZipList' where
    pure _ = ZipList' Nil
    (<*>) (ZipList' Nil) _ = ZipList' Nil
    (<*>) _ (ZipList' Nil) = ZipList' Nil
    (<*>) (ZipList' fns) (ZipList' vals) = ZipList' (zipWith' ($) fns vals)

instance Arbitrary a => Arbitrary (List a) where
    arbitrary = Cons <$> arbitrary <*> arbitrary

instance Arbitrary a => Arbitrary (ZipList' a) where
    arbitrary = ZipList' <$> arbitrary

z = ZipList' (Cons 1 (Cons 2 (Cons 10 Nil)))

-- TODO - couldn't get the applicative law quickcheck to work
-- main =
--     quickBatch $ applicative (ZipList' (Cons ("a", "b", 1 :: Int) Nil))