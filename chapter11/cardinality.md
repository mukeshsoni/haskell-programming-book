What's the cardinality?

1. `data PugType = PugData`

**Ans**
1

2.
```haskell
data Airline =
      PapuAir
    | CatapultsR'Us
    | TakeYourChancesUnited
```

**Ans**
3

3. `Int16`?

**Ans**
2^16 = 65536

4. Use the REPL and use `maxBound` and `minBound` to examine `Int` and `Integer`. What can you say about the cardinality of those types?

**Ans**

Int - 1.844674407E19
Integer - Infinity

5. What's the connection between 8 in `Int8` and that type's cardinality 256?

**Ans**

Cardinality of `Int8` == 2^8 = 256