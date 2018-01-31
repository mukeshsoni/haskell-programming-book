import Data.Foldable

data Three a b c =
    Three a b c
    deriving (Show, Eq)

instance Foldable (Three a b) where
    foldMap f (Three _ _ c) = f c