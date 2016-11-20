## McCarthy 91 function

We’re going to describe a function in English, then in math notation, then show you what your function should return for some test inputs.

Your task is to write the function in Haskell.

The McCarthy 91 function yields 𝑥 − 10 when 𝑥 > 100 and 91 otherwise. The function is recursive.

𝑀𝐶(𝑛) = 𝑛 − 10 if 𝑛 > 100
MC(n) = 𝑀𝐶(𝑀𝐶(𝑛 + 11)) if 𝑛 ≤ 100

**Ans**
```haskell
mc91 n
    | n > 100 = n - 10
    | otherwise = mc91 . mc91 $ (n + 11)
```