```haskell
data PugType = PugData
data HuskType a = HuskyData
data DogueDeBordeaux doge = DogueDeBordeaux doge

data Doggies a = 
    Husky a
  | Mastiff a
  defiving (Eq, Show)
```

1. Is `Doggies` a type constructor or a data constructor?

**Ans**

`Doggies` is a type constructor.

2. What is the kind of `Doggies`?

**Ans**

The kind of `Doggies` is `* -> *`.

3. What is the kind of `Doggies String`?

**Ans**

The kind of `Doggies String` is `*`.

4. What is the type of `Husky 10`?

**Ans**

The type of `Husky 10` is `Doggies [Char]`.

5. What is the type of `Husky (10 :: Integer)`?

**Ans**

The type of `Husky (10 :: Integer)` is `Doggies Integer`.

6. What is the type of `Mastiff "Scooby Doo"`?

**Ans**

The type of `Mastiff "Scooby Doo"` is `Doggies [Char]`.

7. is `DogueDeBordeaux` a type constructor or a data constructor?

**Ans**

`DogueDeBordeaux` is both a type constructor and a data constructor.

8. What is the type of `DogueDeBordeaux`?

**Ans**

The type of `DogueDeBordeaux` is `doge -> DogueDeBordeaux doge`.

9. What is the type of `DogueDeBordeaux "doggie!"`?

**Ans**

The type of `DogueDeBordeaux "doggie!"` is `DogueDeBordeaux [Char]`.
