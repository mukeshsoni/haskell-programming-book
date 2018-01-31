data Tree a =
    Empty
  | Leaf a
  | Node a (Tree a) (Tree a)
  deriving (Show, Eq)

instance Functor Tree where
    fmap f Empty = Empty
    fmap f (Leaf x) = Leaf (f x)
    fmap f (Node x t1 t2) = Node (f x) (fmap f t1) (fmap f t2)

instance Foldable Tree where
    foldMap _ Empty = mempty
    foldMap f (Leaf x) = f x
    foldMap f (Node x t1 t2) = f x `mappend` (foldMap f t1 `mappend` foldMap f t2)

instance Traversable Tree where
    traverse _ Empty = pure Empty
    traverse f (Leaf x) = Leaf <$> f x
    traverse f (Node x t1 t2) = Node <$> (f x) <*> traverse f t1 <*> traverse f t2 
