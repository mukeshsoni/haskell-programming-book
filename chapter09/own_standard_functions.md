Below are the outlines of some standard functions. The goal here is to write your own versions of these to gain a deeper understanding of recursion over lists and how to make functions flexible enough to accept a variety of inputs.

1. myOr returns True if any Bool in the list is True.
```haskell
myOr :: [Bool] -> Bool
myOr = undefined
```

**Ans**

```haskell
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = if x == True then True else myOr xs
```

2. myAny returns True if a -> Bool applied to any of the values in the list returns True.
```haskell
myAny :: (a -> Bool) -> [a] -> Bool
myAny = undefined
```

Example for validating myAny:
```haskell
Prelude> myAny even [1, 3, 5]
False
Prelude> myAny odd [1, 3, 5]
True
```

**Ans**
```haskell
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = if f x == True then True else myAny f xs
```

3. After you write the recursive myElem, write another version that
uses any.
```haskell
-- the built-in version of 'elem' in GHC 7.10
-- and newer has a type that uses Foldable
-- instead of the list type specifically. You
-- can ignore that and write the concrete
-- version that works only for list.
myElem :: Eq a => a -> [a] -> Bool

Prelude> myElem 1 [1..10]
True
Prelude> myElem 1 [2..10]
False 
```

**Ans**
```haskell
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem a (x:xs) = a == x || myElem a xs

myElem' :: Eq a => a -> [a] -> Bool
myElem' a l = myAny (\x -> x == a) l
```

4. Implement myReverse.
```haskell
myReverse :: [a] -> [a]
myReverse = undefined
Prelude> myReverse "blah"
"halb"
Prelude> myReverse [1..5]
[5,4,3,2,1]
```

**Ans**
```haskell
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]
```

5. squish flattens a list of lists into a list
```haskell
squish :: [[a]] -> [a]
squish = undefined
```

**Ans**
```haskell
squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = x ++ squish xs
```

6. squishMap maps a function over a list and concatenates the results.
```haskell
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap = undefined
Prelude> squishMap (\x -> [1, x, 3]) [2]
[1,2,3]
Prelude> squishMap (\x -> "WO "++[x]++" HOO ") "123"
"WO 1 HOO WO 2 HOO WO 3 HOO "
```

**Ans**
```haskell
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

-- OR

squishMap' :: (a -> [b]) -> [a] -> [b]
squishMap' f l = squish $ map f l
```

7. squishAgain flattens a list of lists into a list. This time re-use the squishMap function.
```haskell
squishAgain :: [[a]] -> [a]
squishAgain = undefined
```

**Ans**
```haskell
-- implement squish but using squishMap
squishAgain :: [[a]] -> [a]
squishAgain l = squishMap (\x -> x) l
```

8. myMaximumBy takes a comparison function and a list and returns the greatest element of the list based on the last value that the comparison returned GT for. If you import maximumBy from `Data.List`, you’ll see the type is:
```haskell
Foldable t => (a -> a -> Ordering) -> t a -> a
```

rather than

```haskell
(a -> a -> Ordering) -> [a] -> a
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy = undefined
Prelude> let xs = [1, 53, 9001, 10]
Prelude> myMaximumBy compare xs
9001
```

9. `myMinimumBy` takes a comparison function and a list and returns the least element of the list based on the last value that the
comparison returned LT for.
```haskell
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy = undefined
Prelude> let xs = [1, 53, 9001, 10]
Prelude> myMinimumBy compare xs
1
```

Using the `myMinimumBy` and `myMaximumBy` functions, write your own versions of maximum and minimum. If you have GHC 7.10 or newer,
you’ll see a type constructor that wants a Foldable instance instead of a list as has been the case for many functions so far.
```haskell
myMaximum :: (Ord a) => [a] -> a
myMaximum = undefined
myMinimum :: (Ord a) => [a] -> a
myMinimum = undefined
```