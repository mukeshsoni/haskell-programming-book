Our dividedBy function wasn’t quite ideal. For one thing. It was a partial function and doesn’t return a result (bottom) when given a divisor that is 0 or less.

Using the pre-existing div function we can see how negative numbers
should be handled:
```
Prelude> div 10 2
5
Prelude> div 10 (-2)
-5
Prelude> div (-10) (-2)
5
Prelude> div (-10) (2)
-5
```

Existing definition of `divideBy` 
```haskell
dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where go n d count
        | n < d = (count, n)
        | otherwise = go (n - d) d (count + 1)
```

The next issue is how to handle zero. Zero is undefined for division in math, so really we ought to use a datatype that lets us say there was no sensible result when the user divides by zero. If you need inspiration, consider using the following datatype to handle
this.

```haskell
data DividedResult =
      Result Integer
    | DividedByZero
```

**Ans**

The below function works similar to `quotRem`
```haskell
data DividedResult =
    Result (Integer, Integer)
  | DividedByZero
  deriving (Show)

-- if either numerator or denominator is negative, send -1, else send +1
getSign x y
  | x*y < 0 = -1
  | otherwise = 1
    
dividedBy' :: Integer -> Integer -> DividedResult
dividedBy' _ 0 = DividedByZero
dividedBy' num denom = 
  let 
      (a, b) = go (abs num) (abs denom) 0
      go x y count
        | x < y = (count, x)
        | otherwise = go (x - y) y (count + 1)
  in
     Result ((getSign num denom) * a, b)
```