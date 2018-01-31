import Data.Monoid

data Three a b c =
    Three a b c
    deriving (Show, Eq)
  
instance Functor (Three a b) where
    fmap f (Three a b c) = Three a b $ f c

instance Foldable (Three a b) where
    foldMap f (Three _ _ c) = f c

instance Traversable (Three a b) where
    traverse f (Three a b c) = (Three a b) <$> f c