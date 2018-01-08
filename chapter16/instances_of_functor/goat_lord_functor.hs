import Test.QuickCheck
import Test.QuickCheck.Function
import FunctorLaws

data GoatLord a =
    NoGoat
  | OneGoat a
  | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)
  deriving (Eq, Show)

instance Functor GoatLord where
    fmap _ NoGoat = NoGoat
    fmap f (OneGoat a) = OneGoat (f a)
    fmap f (MoreGoats g1 g2 g3) = MoreGoats (fmap f g1) (fmap f g2) (fmap f g3)

type Size = Int

arbitraryGoatsSized :: Arbitrary a => Size -> Gen (GoatLord a)
arbitraryGoatsSized n
  | n <= 0 = return NoGoat
  | n == 1 = fmap OneGoat arbitrary
  | n > 6 = arbitraryGoatsSized 6
  -- cheating in the line below and using applicatives even though
  -- they appear in a later chapter
  -- also means i am doing the exercises after reading the later chapters :P
  | otherwise = MoreGoats <$> arbitraryGoatsSized (n - 1) <*> arbitraryGoatsSized (n - 2) <*> arbitraryGoatsSized (n - 3)

instance (Arbitrary a) => Arbitrary (GoatLord a) where
    arbitrary = sized arbitraryGoatsSized

main = do
    quickCheck (functorIdentity :: GoatLord Int -> Bool)
    quickCheck (functorCompose' :: GoatLord Int -> Fun Int Int -> Fun Int Int -> Bool)
    quickCheck (functorCompose' :: GoatLord String -> Fun String String -> Fun String String -> Bool)
