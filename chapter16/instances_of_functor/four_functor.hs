import Test.QuickCheck
import FunctorLaws

data Four a b c d = Four a b c d deriving (Eq, Show)

instance Functor (Four a b c) where
    fmap f (Four a b c d) = Four a b c (f d)

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary (Four a b c d) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        z <- arbitrary
        k <- arbitrary
        return (Four x y z k)

main = do
    quickCheck (functorIdentity :: Four Int Int Int Int -> Bool)
    quickCheck (functorIdentity :: Four String Int Int Int -> Bool)
    quickCheck (functorCompose' :: Four Int Int String String -> Fun String String -> Fun String String -> Bool)
    quickCheck (functorCompose' :: Four String Int Int Int -> Fun Int Int -> Fun Int Int -> Bool)
