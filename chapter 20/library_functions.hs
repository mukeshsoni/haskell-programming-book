import Data.Foldable
import Data.Monoid

xSum :: (Foldable t, Num a) => t a -> a
xSum = foldr (+) 0

xProduct :: (Foldable t, Num a) => t a -> a
xProduct = foldr (*) 1

xElem :: (Foldable t, Eq a) => a -> t a -> Bool
xElem x = foldr (\y acc -> acc || (y == x)) False

getMin x acc =
    case acc of
        Nothing -> Just x
        Just y -> if x < y then Just x else acc

xMinimum :: (Foldable t, Ord a) => t a -> Maybe a
xMinimum = foldr getMin Nothing

getMax x acc =
    case acc of
        Nothing -> Just x
        Just y -> if x > y then Just x else acc

xMaximum :: (Foldable t, Ord a) => t a -> Maybe a
xMaximum = foldr getMax Nothing

xNull :: (Foldable t) => t a -> Bool
xNull = foldr (\_ _ -> False) True

xLength :: (Foldable t) => t a -> Int
xLength = foldr (\_ acc -> acc + 1) 0

xToList :: (Foldable t) => t a -> [a]
xToList = foldr (\x acc -> x : acc) []

xFold :: (Foldable t, Monoid m) => t m -> m
xFold = foldMap id

xFoldMap :: (Foldable t, Monoid m) => (a -> m) -> t a -> m
xFoldMap f = foldr (\x acc -> acc `mappend` f x) mempty