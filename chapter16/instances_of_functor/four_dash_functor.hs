import Test.QuickCheck
import Test.QuickCheck.Function
import FunctorLaws

data Four' a b = Four' a a a b deriving (Eq, Show)

instance Functor (Four' a) where
    fmap f (Four' a b c d) = Four' a b c (f d)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Four' a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        z <- arbitrary
        k <- arbitrary
        return (Four' x y z k)

main = do
    quickCheck (functorIdentity :: Four' Int Int -> Bool)
    quickCheck (functorIdentity :: Four' String Int -> Bool)
    quickCheck (functorCompose' :: Four' Int String -> Fun String String -> Fun String String -> Bool)
    quickCheck (functorCompose' :: Four' String Int -> Fun Int Int -> Fun Int Int -> Bool)
