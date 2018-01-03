import Test.QuickCheck
import Test.QuickCheck.Function
import FunctorLaws

data Three' a b = Three' a b b deriving (Eq, Show)

instance Functor (Three' a) where
    fmap f (Three' a b c) = Three' a (f b) (f c)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Three' a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        z <- arbitrary
        return (Three' x y z)

main = do
    quickCheck (functorIdentity :: Three' Int Int -> Bool)
    quickCheck (functorIdentity :: Three' String Int -> Bool)
    quickCheck (functorCompose' :: Three' Int String -> Fun String String -> Fun String String -> Bool)
    quickCheck (functorCompose' :: Three' String Int -> Fun Int Int -> Fun Int Int -> Bool)
