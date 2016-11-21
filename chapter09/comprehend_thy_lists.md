```haskell
mySqr = [x^2 | x <- [1..5]]
```

Take a look at the following functions, figure what you think the output lists will be, and then run them in your REPL to verify (note that you will need the mySqr list from above in scope to do this):
```haskell
[x | x <- mySqr, rem x 2 == 0]
```

**Ans**
[4, 16]

```haskell
[(x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50]
```

**Ans**
```haskell
[]
```

```haskell
take 5 [ (x, y) | x <- mySqr
       , y <- mySqr, x < 50, y > 50 ]
```

**Ans**
```haskell
[]
```