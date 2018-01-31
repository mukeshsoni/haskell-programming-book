import Data.Monoid

data Three' a b =
    Three' a b b
    deriving (Show, Eq)
  
instance Functor (Three' a) where
    fmap f (Three' a b c) = Three' a (f b) (f c)

instance Foldable (Three' a) where
    foldMap f (Three' a b c) = f b `mappend` f c

instance Traversable (Three' a) where
    traverse f (Three' a b c) = (Three' a) <$> f b <*> f c