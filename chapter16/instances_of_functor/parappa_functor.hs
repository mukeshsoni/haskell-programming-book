{-# LANGUAGE FlexibleInstances #-}
import Test.QuickCheck
import Test.QuickCheck.Function
import FunctorLaws

data Parappa f g a =
    Parappa (f a) (g a)
    deriving (Eq, Show)

instance Functor (Parappa Maybe Maybe) where
    fmap fn (Parappa k l) = Parappa (fmap fn k) (fmap fn l)

instance (Arbitrary a) => Arbitrary (Parappa Maybe Maybe a) where
    arbitrary = do
        a <- arbitrary
        oneof [return (Parappa Nothing Nothing), return (Parappa (Just a) Nothing), return (Parappa Nothing (Just a)), return (Parappa (Just a) (Just a))]

main = do
    quickCheck (functorIdentity :: Parappa Maybe Maybe Int -> Bool)
    quickCheck (functorCompose' :: Parappa Maybe Maybe Int -> Fun Int Int -> Fun Int Int -> Bool)
    quickCheck (functorCompose' :: Parappa Maybe Maybe String -> Fun String String -> Fun String String -> Bool)
