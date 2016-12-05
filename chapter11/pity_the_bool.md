1. Given the datatype
```haskell
data BigSmall =
      Big Bool
    | Small Bool
    deriving (Eq, Show)
```

What is the cardinality of this datatype? Hint: We already know `Bool`'s cardinality. Show you work as demonstrated earlier.

```
Big Bool | Small Bool

-- Replacing `or` with sum (+) 
Big Bool + Small Bool
cardinality(Bool) + cardinality(Bool)
2 + 2
4
```

2. Given a datatype
```
-- needed to have Int8 in scope
import Data.Int

data NumberOrBool = 
      Numba Int8
    | BoolyBool Bool
    deriving (Eq, Show)

-- Example use of Numba, parentheses due to syntactic collision between (-) minux and the negate function
let myNumba = Numba (-128)
```

What is the cardinality of `NumberOrBool`? 

**Ans**
The cardinality of `NumberOrBool` is cardinality(Int8) + cardinality(Bool) == 256 + 2 == 258

What happens if you try to create a `Numba` with a numeric literal larger than 127?

**Ans**

If we try to create a `Numba` with a numeric literal larger than 127, it wraps around -128-127 (using modulo operation). E.g. `Numba 128` would wrap around to `Numba (-128)`, `Numba 130` would wrap around to `Numba (-126)` and so on.

And with a numeric literal smaller than (-128)?

**Ans**

With numeric literal's smaller than (-128), it wraps around `127` and downwards.
