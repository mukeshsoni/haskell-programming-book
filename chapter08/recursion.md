1. Write out the steps for reducing dividedBy 15 2 to its final answer according to the Haskell code.

2. Write a function that recursively sums all numbers from 1 to n, n being the argument. So that if n was 5, you’d add 1 + 2 + 3 + 4 + 5 to get 15. The type should be `(Eq a, Num a) => a -> a`.

**Ans**
```haskell
addn :: (Num a, Eq a) => a -> a
addn 0 = 0
addn n = n + addn (n - 1)
```

3. Write a function that multiplies two integral numbers using recursive summation. The type should be `(Integral a) => a -> a -> a`.

**Ans**
```haskell
addMul :: (Num a, Eq a) => a -> a -> a
addMul mul 0 = 0
addMul mul y = mul + addMul mul (y - 1)
```
