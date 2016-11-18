## Match the types

We’re going to give you two types and their implementations. Then we’re going to ask you if you can substitute the second type for the first. You can test this by typing the first declaration and its type into a file and editing in the new one, loading to see if it fails. Don’t just guess, test all your answers!

1. For the following definition. 

a) 
```haskell
i :: Num a => a
i=1
```

b) Try replacing the type signature with the following:

```haskell
i :: a
```

After you’ve formulated your own answer, then tested that answer and believe you understand why you were right or wrong, make sure to use GHCi to check what type GHC infers for the definitions we provide without a type assigned. For example, for this one, you’d type in:

```
Prelude> let i = 1
Prelude> :t i
    -- Result elided intentionally.
```

**Ans**

This will not work.

When we say `i :: a`, that means a can be of any type. But `i = 1` implies that i belongs to atleast the `Num` typeclass.
But there is no way for the compiler to verify if `a` belongs to the `Num` typeclass.

2. 
a) 
```haskell
f :: Float 
f = 1.0
```

b) 
```haskell
f :: Num a => a
```

**Ans**

This will not typecheck. The literal `1.0` implies that it belongs at least `Fractional` typeclass. Specifying `Num a => a` does not guarantee that `a` implements functions in the `Fractional` typeclass. 

3. 

a)

```haskell
f :: Float
f = 1.0
```

b) 
```haskell
f :: Fractional a => a
```

**Ans**

This will typecheck. For reasons mentioned above.

4. Hint for the following: type :info RealFrac in your REPL.
a) 
```haskell
f :: Float
f = 1.0
```

b) 
```haskell
f :: RealFrac a => a
```

**Ans**

Checking for `RealFrac` in the repl tell us - 

```
class (Real a, Fractional a) => RealFrac a where
```

Which means that any type which implements `RealFrac` should have implemented `Real` and `Frac` functions.

Which means, if a value is `RealFrac`, it is definitely a `Fractional`, which is all that the literal `1.0` demands.


5.
a)
```haskell
freud :: a -> a 
freud x = x
```

b) 
```haskell
freud :: Ord a => a -> a
```

**Ans**

It will typecheck since we are replacing a generic constrant (`a -> a`) with a more specific one.

6.
a)
```haskell
freud' :: a -> a 
freud' x = x
```

b)
```haskell
freud' :: Int -> Int
```

**Ans**

It will typecheck. For the same reason as 5)

7.
a)
```haskell
myX = 1 :: Int

sigmund :: Int -> Int 
sigmund x = myX
```

b)
```haskell
sigmund :: a -> a
```

**Ans**

This will not typecheck. We are replacing a specific type definition (`Int`) with a more generic one (`a`).

`myX` is an `Int` but `a` might or might not be an `Int`.

8.
a)
```haskell
myX = 1 :: Int 

sigmund' :: Int -> Int
sigmund' x = myX
```

b)
```haskell
sigmund' :: Num a => a -> a
```

**Ans**

It will not typecheck. For the same reason as (7)