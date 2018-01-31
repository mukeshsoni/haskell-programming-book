import Data.Foldable

data Constant a b =
    Constant a
    deriving (Show, Eq)

instance Foldable (Constant a) where
    foldMap _ _ = mempty