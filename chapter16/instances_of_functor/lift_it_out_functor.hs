{-# LANGUAGE FlexibleInstances #-}
import Test.QuickCheck
import Test.QuickCheck.Function
import FunctorLaws

data LiftItOut f a =
    LiftItOut (f a)
    deriving (Eq, Show)

instance Functor (LiftItOut Maybe) where
    fmap fn (LiftItOut ftor) = LiftItOut (fmap fn ftor)

instance (Arbitrary a) => Arbitrary (LiftItOut Maybe a) where
    arbitrary = do
        a <- arbitrary
        oneof [return (LiftItOut Nothing), return (LiftItOut (Just a))]

main = do
    quickCheck (functorIdentity :: LiftItOut Maybe Int -> Bool)
    quickCheck (functorCompose' :: LiftItOut Maybe Int -> Fun Int Int -> Fun Int Int -> Bool)
    quickCheck (functorCompose' :: LiftItOut Maybe String -> Fun String String -> Fun String String -> Bool)
