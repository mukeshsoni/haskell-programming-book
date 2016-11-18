# Grab Bag

Note the following exercises are from source code files, not written for use directly in the REPL. Of course, you can change them to test directly in the REPL if you prefer.

1. Which (two or more) of the following are equivalent?

a) mTh x y z = x * y * z

b) mTh x y = \z -> x * y * z

c) mTh x = \y -> \z -> x * y * z

d) mTh = \x -> \y -> \z -> x * y * z

**Ans**

All of them


2. The type of mTh (above) `isNum a => a -> a -> a -> a`. Which is the type of `mTh 3`?

a) Integer -> Integer -> Integer 

b) Num a => a -> a -> a -> a

c) Num a => a -> a

d) Num a => a -> a -> a

**Ans**

(d)

3. Next, we’ll practice writing anonymous lambda syntax. For example, one could rewrite:

`addOne x = x + 1`

Into:

`addOne = \x -> x + 1`

Try to make it so it can still be loaded as a top-level definition by GHCi. This will make it easier to validate your answers.

a) Rewrite the `f` function in the where clause.
```haskell
addOneIfOdd n = case odd n of 
    True -> f n
    False -> n
    where f n = n + 1
```

**Ans**

```haskell
addOneIfOdd = \n -> case odd n of
    True -> f n
    False -> n
    where f = \n -> n + 1
```

b) Rewrite the following to use anonymous lambda syntax:
```haskell
addFive x y = (if x > y then y else x) + 5
```

**Ans**
```haskell
addFive = \x -> \y -> (if x > y then y else x) + 5
``` 

c) Rewrite the following so that it doesn’t use anonymous lambda syntax:
```haskell
mflip f = \x -> \y -> f y x
```

**Ans**

```haskell
mflip f x y = f y x
```