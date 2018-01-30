import Data.Foldable

xSum :: (Foldable t, Num a) => t a -> a
xSum = foldr (+) 0

xProduct :: (Foldable t, Num a) => t a -> a
xProduct = foldr (*) 1

-- xElem :: (Foldable t, Eq a) => a -> t a -> Bool