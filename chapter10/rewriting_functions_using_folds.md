In the previous chapters, you wrote these functions using direct recursion over lists. The goal now is to rewrite them using folds. Where possible, to gain a deeper understanding of folding, try rewriting the fold version so that it is point-free.

Point-free versions of these functions written with a fold should look like: 

```haskell
myFunc = foldr f z
```

So for example with the `and` function:

```haskell
-- Again, this type will be less reusable than
-- the one in GHC 7.10 and newer. Don't worry.

-- direct recursion, not using (&&)
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = 
    if x = False
    then False
    else myAnd xs

-- direct recursion, using (&&)
myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs

-- fold, not point-free in the folding function
myAnd :: [Bool] -> Bool
myAnd = foldr
        (\a b -> 
            if a == False then False else True) True

-- fold, both myAnd and the folding function are point-free now
myAnd :: [Bool] -> Bool
myAnd = foldr (&&) True
```

1. `myOr` returns `True` if any `Bool` in the list is `True`.
```haskell
myOr :: [Bool] -> Bool
myOr = undefined
```

**Ans**
```haskell
myOr' :: [Bool] -> Bool
myOr' = foldr (||) False
```

2. `myAny` returns `True` if `a -> Bool` applied to any of the values in the list returns `True`
```haskell
myAny :: (a -> Bool) -> [a] -> Bool
myAny = undefined
```

**Ans**
```haskell
myAny' :: (a -> Bool) -> [a] -> Bool
myAny' f l = foldr (\x acc -> acc || f x) False l
```

3. Write two versions of `myElem`. One version should use folding and the other should use `any`.

```haskell
myElem :: Eq a => a -> [a] -> Bool
```

**Ans**
```haskell
myElem'' :: Eq a => a -> [a] -> Bool
myElem'' elem = foldr (\x acc -> acc || x == elem) False

myElem''' :: Eq a => a -> [a] -> Bool
myElem''' elem = any (\a -> a == elem)
```

4. Implement `myReverse`, don't worry about trying to make it lazy.

```haskell
myReverse :: [a] -> [a]
myReverse = undefined
```

**Ans**
```haskell
```

5. Write `myMap` in terms of foldr. It should have the same behavior as the build-in `map`.

```haskell
myMap :: (a -> b) -> [a] -> [b]
mymap = undefined
```

**Ans**
```haskell
myMap' :: (a -> b) -> [a] -> [b]
myMap' f = foldr (\x acc -> f x : acc) []
```

6. Write `myFilter` in terms of foldr. It should have the same behavior as the build-in filter.

```haskell
myFilter' :: (a -> Bool) -> [a] -> [a]
myFilter' f = undefined
```

**Ans**
```haskell
myFilter' :: (a -> Bool) -> [a] -> [a]
myFilter' f = foldr (\x acc -> if f x then x : acc else acc) []
```

7. `squish` flattens a list of lists into a list
```haskell
squish :: [[a]] -> [a]
squish = undefined
```

**Ans**
```haskell
squish' :: [[a]] -> [a]
squish' = foldr (\x acc -> x ++ acc) []
```

8. `squishMap` maps a function over a list and concatenates the results.
```haskell
squishMap :: (a -> [b]) -> [a] -> [b]
squishMap = undefined
```

**Ans**
```haskell
squishMap'' :: (a -> [b]) -> [a] -> [b]
squishMap'' f = foldr (\x acc -> f x ++ acc) []
```

9. `squishAgain` flattens a list of lists into a list. This time reuse the `squishMap` function.
```haskell
squishAgain :: [[a]] -> [a]
squishAgain = undefined
```

**Ans**
```haskell
squishAgain' :: [[a]] -> [a]
squishAgain' = squishMap' id
```

10. `myMaximumBy` takes a comparison function and a lsit and returns the greatest element of the lsit based on the last value that the comparison returned `GT` for.
```haskell
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy = undefined
```

**Ans**
```haskell
myMaximumBy' :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy' _ [] = error "Needs atleast one element in the list"
myMaximumBy' f l = foldr (\x acc -> if f x acc == GT then x else acc) (last l) l
```

11. `myMinimumBy` takes a comparison function and a list and returns the least element of the list based on the last value that the comparison returned LT for.
```haskell
myMinimumBy :: :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy = undefined
```

**Ans**
```haskell
myMinimumBy' :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy' _ [] = error "Needs atleast one element in the list"
myMinimumBy' f l = foldr (\x acc -> if f x acc == LT then x else acc) (last l) l
```