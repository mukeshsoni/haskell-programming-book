import Test.QuickCheck
import FunctorLaws

data Pair a = Pair a a deriving (Eq, Show)

instance Functor Pair where
    fmap f (Pair a b) = Pair (f a) (f b)

instance (Arbitrary a) => Arbitrary (Pair a) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        return (Pair x y)

main = do
    quickCheck (functorIdentity :: Pair Int -> Bool)
    quickCheck (functorIdentity :: Pair String -> Bool)
    quickCheck (functorCompose' :: Pair Int -> Fun Int Int -> Fun Int Int -> Bool)
    quickCheck (functorCompose' :: Pair String -> Fun String String -> Fun String String -> Bool)
