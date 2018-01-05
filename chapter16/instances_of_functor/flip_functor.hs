{-# LANGUAGE FlexibleInstances #-}

import Test.QuickCheck
import Test.QuickCheck.Function
import FunctorLaws

data Flip f a b = Flip (f b a) deriving (Eq, Show)
newtype K a b = K a deriving (Eq, Show)

instance Functor (Flip K a) where
    fmap f (Flip (K b)) = Flip (K (f b))

instance (Arbitrary a, Arbitrary b) => Arbitrary (Flip K a b) where
    arbitrary = do
        y <- arbitrary
        return (Flip (K y))

main = do
    quickCheck (functorIdentity :: Flip K Int Int -> Bool)
    quickCheck (functorIdentity :: Flip K String Int-> Bool)
    quickCheck (functorCompose' :: Flip K String String -> Fun String String -> Fun String String -> Bool)
    quickCheck (functorCompose' :: Flip K Int Int -> Fun Int Int -> Fun Int Int -> Bool)
