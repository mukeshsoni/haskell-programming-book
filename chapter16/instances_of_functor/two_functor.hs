import Test.QuickCheck
import FunctorLaws

data Two a b = Two a b deriving (Eq, Show)

instance Functor (Two a) where
    fmap f (Two a b) = Two a (f b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        x <- arbitrary
        y <- arbitrary
        return (Two x y)

main = do
    quickCheck (functorIdentity :: Two Int Int -> Bool)
    quickCheck (functorIdentity :: Two String Int-> Bool)
    quickCheck (functorCompose' :: Two Int String -> Fun String String -> Fun String String -> Bool)
    quickCheck (functorCompose' :: Two String Int -> Fun Int Int -> Fun Int Int -> Bool)
