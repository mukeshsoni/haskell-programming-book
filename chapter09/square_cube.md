Given the following:
```haskell
Prelude> let mySqr = [x^2 | x <- [1..5]]
Prelude> let myCube = [y^3 | y <- [1..5]]
```

1. First write an expression that will make tuples of the outputs of mySqr and myCube.

```haskell
[(x, y) | x <- mySqr, y <- myCube]
```

2. Now alter that expression so that it only uses the x and y values that are less than 50.

```haskell
[(x, y) | x <- mySqr, y <- myCube, x < 50, y <50]
```


3. Apply another function to that list comprehension to determine how many tuples inhabit your output list.

```haskell
length [(x, y) | x <- mySqr, y <- myCube, x < 50, y <50]
```
