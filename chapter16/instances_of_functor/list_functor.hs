import Test.QuickCheck
import Test.QuickCheck.Function
import FunctorLaws

data List a =
    Nil
  | Cons a (List a)
  deriving (Eq, Show)

instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons a Nil) = Cons (f a) Nil 
    fmap f (Cons a l) = Cons (f a) (fmap f l)

type Size = Int

arbitraryListSized :: Arbitrary a => Size -> Gen (List a)
arbitraryListSized n
  | n == 0 = return Nil
  | n > 6 = arbitraryListSized 6
  -- cheating in the line below and using applicatives even though
  -- they appear in a later chapter
  -- also means i am doing the exercises after reading the later chapters :P
  | otherwise = Cons <$> arbitrary <*> arbitraryListSized (n - 1)

instance (Arbitrary a) => Arbitrary (List a) where
    arbitrary = sized arbitraryListSized

main = do
    quickCheck (functorIdentity :: List Int -> Bool)
    quickCheck (functorCompose' :: List Int -> Fun Int Int -> Fun Int Int -> Bool)
