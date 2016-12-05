```haskell
data Example = MakeExample deriving Show
```

1. You can query the tpe of a vlaue in GHCi with the :type command, also abbreviated :t. Example:

```haskell
Predlue> :t False
False :: Bool
```

What is the type of data constructor `MakeExample`? What happens when you request the the of `Example`?

**Ans**

The type of `MakeExample` is `Example`.

When trying to get the type of `Example`, GHCi tells us that the data constructor `Example` is not in scope. It's because data constructors have type and not type constructors (well they have something like type which is called `kind`).

2. What if you try `:info` on `Example` in GHCi? Can you determine what typeclass instances are defined for the `Example` type using `:info` in GHCi?

**Ans**

Trying out `:info Example` tells us about the definition of `Example` type constructor.

It also tells us the typeclass instances it has implemented. For `Example`, the `Show` typeclass has been implemented (because of `deriving Show`).

3. Try making a new datatype like `Example` but with a single type argument added to `MakeExample`, such as `Int`. What has changed when you query `MakeExample` with `:type` in GHCi?

**Ans**

```haskell
data Example = MakeExample Int deriving Show
```

Querying `MakeExample` for type, `:t MakeExample`, tells us that `MakeExample` is a function which expects one argument of type `Int` and returns a value of type `Example`.