import Data.Foldable

data Four' a b =
    Four' a b b b
    deriving (Show, Eq)

instance Foldable (Four' a) where
    foldMap f (Four' _ b c d) = (f b) `mappend` ((f c) `mappend` (f d))