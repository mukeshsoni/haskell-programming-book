import Test.QuickCheck
import FunctorLaws

newtype Identity a = Identity a deriving (Eq, Show)

instance Functor Identity where
    fmap f (Identity a) = Identity (f a)

instance (Arbitrary a) => Arbitrary ( Identity a ) where
    arbitrary = do
        x <- arbitrary
        return (Identity x)

main = do
    quickCheck (functorIdentity :: Identity Int -> Bool)
    quickCheck (functorIdentity :: Identity String -> Bool)
    quickCheck (functorCompose' :: Identity Int -> Fun Int Int -> Fun Int Int -> Bool)
    quickCheck (functorCompose' :: Identity String -> Fun String String -> Fun String String -> Bool)