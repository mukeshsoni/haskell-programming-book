import Data.Foldable

data Two a b =
    Two a b
    deriving (Show, Eq)

instance Foldable (Two a) where
    foldMap f (Two _ b) = f b