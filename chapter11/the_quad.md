Determine how many unique inhabitants each type has.

Suggestion: jsut do the arithmetic unless you want to verify. Writing them out gets tedious quickly.

1.
```haskell
data Quad = 
      One
    | Two
    | Three
    | Four
    deriving (Eq, Show)

-- how many different forms can this take?
eQuad :: Either Quad Quad
eQuad = ???

**Ans**
The cardinality of `Quad` is 4. `Either` is a sum type on both it's type arguments. Hence `Either Quad Quad` can have `4+4`, i.e. 8 possible values.

2. `prodQuad :: (Quad, Quad)`

**And**

`prodQuad` is a product type of `Quad`, hence it can have 4*4, i.e. 16 inhabitants.

3. `funcQuad :: Quad -> Quad`

**And**

We know that a function `f :: a -> b` can have `b^a` different forms. where `b` is the cardinality of whatever type `b` belongs to and `a` is the cardinality of whatever type `a` belongs to. 

Hence `funcQuad` can have `4^4 == 256` different forms.

4. `prodTBool :: (Bool, Bool, Bool)`

**Ans**

`prodTBool` is a product type. Hence it's cardinality will be 2*2*2 == 8.

5. `gTwo :: Bool -> Bool -> Bool`

**Ans**

`gTwo` is a function whose cardinality will be 2^(2^2) == 2^4 == 16.

6. `fTwo :: Bool -> Quad -> Quad`

**Ans**

`fTwo` is a function whose cardinality will be (4^4)^2 == 65536. 