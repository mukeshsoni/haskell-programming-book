1. Given the type
```haskell
data FlowerType = Gardenia
                | Daisy
                | Rose
                | Lilac
                deriving Show

type Gardener = String

data Garden = 
    Garden Gardener FlowerType
    deriving Show
```

What is the normal form of `Garden`?

**Ans**

The normal form of `Garden` is - 
```haskell
data Garden =
      Gardener Gardenia
    | Gardener Daisy
    | Gardener Rose
    | Gardener Lilac
```
