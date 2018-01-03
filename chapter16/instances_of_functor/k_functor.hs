import Test.QuickCheck
import Test.QuickCheck.Function
import FunctorLaws

data K a b = K a deriving (Eq, Show)

instance Functor (K a) where
    fmap _ (K a) = K a

instance (Arbitrary a) => Arbitrary (K a b) where
    arbitrary = do
        a <- arbitrary
        return (K a)

main = do
    quickCheck (functorIdentity :: K Int Int -> Bool)
    quickCheck (functorIdentity :: K String Int-> Bool)
    quickCheck (functorCompose' :: K String String -> Fun String String -> Fun String String -> Bool)
    quickCheck (functorCompose' :: K Int Int -> Fun Int Int -> Fun Int Int -> Bool)
