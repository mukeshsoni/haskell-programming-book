import Test.QuickCheck
import Test.QuickCheck.Function
import FunctorLaws

data Quant a b =
    Finance
  | Desk a
  | Bloor b
  deriving (Eq, Show)

instance Functor (Quant a) where 
    fmap _ Finance = Finance
    fmap _ (Desk a) = Desk a
    fmap f (Bloor b) = Bloor (f b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Quant a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        oneof [return Finance, return (Desk a), return (Bloor b)]

main = do
    quickCheck (functorIdentity :: Quant Int Int -> Bool)
    quickCheck (functorCompose' :: Quant Int Int -> Fun Int Int -> Fun Int Int -> Bool)