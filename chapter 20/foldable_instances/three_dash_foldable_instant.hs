import Data.Foldable

data Three' a b =
    Three' a b b
    deriving (Show, Eq)

instance Foldable (Three' a) where
    foldMap f (Three' _ b c) = (f b) `mappend` (f c)