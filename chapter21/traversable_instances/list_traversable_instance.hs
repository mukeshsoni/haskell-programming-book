import Data.Monoid
-- import Data.Foldable

data List a =
    Nil
  | Cons a (List a)
  deriving (Show, Eq)
  
instance Functor List where
    fmap f Nil = Nil
    fmap f (Cons x xs) = Cons (f x) (fmap f xs)

instance Foldable List where
    foldMap f Nil = mempty
    foldMap f (Cons x xs) = f x `mappend` foldMap f xs

instance Traversable List where
    traverse f Nil = pure Nil
    traverse f (Cons x xs) = Cons <$> f x <*> traverse f xs