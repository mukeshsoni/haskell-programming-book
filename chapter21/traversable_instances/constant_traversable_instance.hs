newtype Constant a b =
    Constant { getConstant :: a }
    deriving (Show, Eq)

instance Functor (Constant a) where
    fmap _ (Constant a) = Constant a

-- This is a tricky one
-- The final type of the foldMap needs to be 'b' in (Constant a b)
-- Since there is no value existence of type 'b' in (Constant a b),
-- we just return the mempty value for type 'b'
instance Foldable (Constant a) where
    foldMap _ _ = mempty

instance Traversable (Constant a) where
    traverse _ (Constant a) = Constant <$> pure a