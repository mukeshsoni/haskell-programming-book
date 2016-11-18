1. Given the following declarations
```haskell
k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2)) 
k3 = k (3, True)
```

a) What is the type of k?

**Ans**

`(a, b) -> a`

b) What is the type of k2? Is it the same type as k1 or k3?

**Ans**

`String`

No

c) Of k1, k2, k3, which will return the number 3 as the result?

**Ans**
`k1 and k3`


2. Fill in the definition of the following function:
```haskell
-- Remember: Tuples have the same syntax for their
-- type constructors and their data constructors.
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f)) 
f = undefined
```

**Ans**
```haskell
f (a, _, c) (d, _, f) = ((a, d), (c,f))