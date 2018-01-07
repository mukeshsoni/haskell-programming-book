{-# LANGUAGE FlexibleInstances #-}
import Test.QuickCheck
import Test.QuickCheck.Function
import FunctorLaws

data Notorious g o a t =
    Notorious (g o) (g a) (g t)
    deriving (Eq, Show)

instance Functor (Notorious Maybe x y) where
    fmap fn (Notorious k l m) = Notorious k l (fmap fn m)

instance (Arbitrary t) => Arbitrary (Notorious Maybe o a t) where
    arbitrary = do
        t <- arbitrary
        oneof [return (Notorious Nothing Nothing (Just t)), return (Notorious Nothing Nothing Nothing)]

main = do
    quickCheck (functorIdentity :: Notorious Maybe Int Int Int -> Bool)
    quickCheck (functorCompose' :: Notorious Maybe Int Int Int -> Fun Int Int -> Fun Int Int -> Bool)
    quickCheck (functorCompose' :: Notorious Maybe Int String String -> Fun String String -> Fun String String -> Bool)
