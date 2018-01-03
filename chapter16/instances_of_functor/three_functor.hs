import Test.QuickCheck
import Test.QuickCheck.Function
import FunctorLaws

data Three a b c = Three a b c deriving (Eq, Show)

instance Functor (Three a b) where
    fmap f (Three a b c) = Three a b (f c)

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        z <- arbitrary
        return (Three x y z)

main = do
    quickCheck (functorIdentity :: Three Int Int Int -> Bool)
    quickCheck (functorIdentity :: Three String Int Int-> Bool)
    quickCheck (functorCompose' :: Three Int Int String -> Fun String String -> Fun String String -> Bool)
    quickCheck (functorCompose' :: Three String Int Int -> Fun Int Int -> Fun Int Int -> Bool)
