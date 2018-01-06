{-# LANGUAGE FlexibleInstances #-}
import Test.QuickCheck
import Test.QuickCheck.Function
import FunctorLaws

data IgnoreOne f g a b =
    IgnoreOne (f a) (g b)
    deriving (Eq, Show)

instance Functor (IgnoreOne f Maybe x) where
    fmap fn (IgnoreOne k l) = IgnoreOne k (fmap fn l)

instance (Arbitrary a, Arbitrary b) => Arbitrary (IgnoreOne Maybe Maybe a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        oneof [return (IgnoreOne Nothing Nothing), return (IgnoreOne (Just a) Nothing), return (IgnoreOne Nothing (Just b)), return (IgnoreOne (Just a) (Just b))]

main = do
    quickCheck (functorIdentity :: IgnoreOne Maybe Maybe Int Int -> Bool)
    quickCheck (functorCompose' :: IgnoreOne Maybe Maybe Int Int -> Fun Int Int -> Fun Int Int -> Bool)
    quickCheck (functorCompose' :: IgnoreOne Maybe Maybe String String -> Fun String String -> Fun String String -> Bool)
