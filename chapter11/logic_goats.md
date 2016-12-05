```haskell
class TooMany a where
    tooMany :: a -> Bool
```

1. Reusing the `TooMany` typeclass, write an instance of the typeclass for the type (Int, String). This will require adding a language pragma called `FlexibleInstances` if you do not use a newtype - GHC will tell you what to do.

**Ans**
With type alias - 

```haskell
-- will need language pragma `FlexibleInstances`
{-# LANGUAGE FlexibleInstances #-}

class TooMany a where
    tooMany :: a -> Bool
 
type AgeName = (Int, String)

instance TooMany AgeName where
    tooMany (age, _) = age > 42
```

2. Make another `TooMany` instance for `(Int, Int)`. Sum the values together under the assumption this is a count of goats from two fields.

**Ans**

```haskell
-- will need language pragma `FlexibleInstances`
{-# LANGUAGE FlexibleInstances #-}

class TooMany a where
    tooMany :: a -> Bool
 
type GoatsFromTwoFields = (Int, Int)

instance TooMany GoatsFromTwoFields where
    tooMany (g1, g2) = g1 + g2 > 42
```

3. Make another `TooMany` instance, this time for `(Num a, TooMany a) => (a, a)`. This can mean whatever you want, such as summing the two numbers together.

**Ans**

```haskell
-- will need language pragma `FlexibleInstances`
{-# LANGUAGE FlexibleInstances #-}

class TooMany a where
    tooMany :: a -> Bool

instance (Num a, TooMany a) => TooMany (a, a) where
    tooMany (x, y) => tooMany (x + y)
``` 