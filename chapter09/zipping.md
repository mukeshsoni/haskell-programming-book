1. Write your own version of `zip :: [a] -> [b] -> [(a, b)]` and ensure it behaves the same as the original.

**Ans**

```haskell                                                
zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys
```

2. Dow what you did for `zip` but for `zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]`

```haskell 
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ _ [] = []
zipWith' _ [] _ = []
zipWith' f (x:xs) (y:ys) = (f x y) : (zipWith' f xs ys)
```

3. Rewrite your `zip` in terms of the `zipWith` you wrote.

**Ans**
```haskell
zip'' = zipWith' (,)
```
