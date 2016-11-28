Here's a function which generates an infinite list of fibonacci numbers - 

```haskell
fibs = 1 : scanl (+) 1 fibs
```

1. Modify your fibs function to only return the first 20 fibonacci numbers.

**Ans**
```haskell
fibsFirst20 = take 20 $ 1 : scanl (+) 1 fibsFirst20
```

2. Modify fibs to return the fibonacci numbers that are less than 100.

**Ans**
```haskell
fibsLessThan100 = takeWhile (<100) $ 1 : scanl (+) 1 fibsLessThan100
```

3. Try to write the factorial function from Recursion as a scan. You will want to scanl again, and your start value will be 1. Warning: this will also generate an infinite list, so you may want to pass it through a `take` function or similar.

```haskell
fact = scanl (*) 1 [1..]
```