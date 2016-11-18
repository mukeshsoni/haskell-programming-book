We’re going to practice using case expressions by rewriting functions. Some of these functions you’ve seen in previous chapters (and some you’ll see later using different syntax yet again!), but you’ll be writing new versions now. Please note these are all written as they would be in source code files, and we recommend you write your answers in source files and then load into GHCi to check, rather than trying to do them directly into the REPL.

### First, rewrite if-then-else expressions into case expressions.

1. The following should return x when x is greater than y.

```haskell
functionC x y = if (x > y) then x else y
```

**Ans**

```haskell
functionC x y = case x > y of 
    True -> x
    False -> y
```

2. The following will add 2 to even numbers and otherwise simply return the input value.
```haskell
ifEvenAdd2 n = if even n then (n+2) else n
```

**Ans**
```haskell
ifEvenAdd2 n = case even n of
    True -> n + 2
    False -> n
```

### The next exercise doesn’t have all the cases covered. See if you can fix it.

3. The following compares a value, x, to zero and returns an indicator for whether x is a postive number or negative number. But what if x is 0? You may need to play with the compare function a bit to find what to do.
```haskell
nums x =
    case compare x 0 of
        LT -> -1 
        GT -> 1
```

**Ans**
```haskell
nums x =
    case compare x 0 of
        LT -> -1 
        GT -> 1
        EQ -> 0
```