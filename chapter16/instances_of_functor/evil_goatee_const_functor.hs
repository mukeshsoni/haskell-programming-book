import Test.QuickCheck
import Test.QuickCheck.Function
import FunctorLaws

data EvilGoateeConst a b =
    GoatyConst b
    deriving (Eq, Show)

instance Functor (EvilGoateeConst a) where
    fmap f (GoatyConst b) = GoatyConst (f b)

instance (Arbitrary b) => Arbitrary (EvilGoateeConst a b) where
    arbitrary = do
        b <- arbitrary
        return (GoatyConst b)

main = do
    quickCheck (functorIdentity :: EvilGoateeConst Int Int -> Bool)
    quickCheck (functorCompose' :: EvilGoateeConst Int Int -> Fun Int Int -> Fun Int Int -> Bool)
    quickCheck (functorCompose' :: EvilGoateeConst String Int -> Fun Int Int -> Fun Int Int -> Bool)