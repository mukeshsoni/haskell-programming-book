Write the following functions for processing this data.

```haskell
import Data.Time

data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]
theDatabase = 
    [ DbDate (UTCTime
                (fromGregorian 1911 5 1)
                (secondsToDiffTime 34123))
    , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime
                (fromGregorian 1921 5 1)
                (secondsToDiffTime 34123))
    ]
```

1. Write a function that filters for DbDate values and returns a list of the UTCTime values inside them.
```haskell
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = undefined
```

**Ans**
```haskell
filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate [] = []
filterDbDate dbItems = go dbItems []
  where
    go [] acc = acc
    go (x:xs) acc =
      case x of
        (DbDate utcTime) -> go xs (acc ++ [utcTime])
        otherwise -> go xs acc

-- OR, the foldr version
filterDbDate' :: [DatabaseItem] -> [UTCTime]
filterDbDate' dbItems = foldr go [] dbItems
  where
    go x acc =
      case x of
        (DbDate utcTime) -> utcTime : acc
        otherwise -> acc
```

2. Write a function that filters for DbNumber values and returns a list of the `Integer` values inside them.
```haskell
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = undefined
```

**Ans**
```haskell
filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber dbItems = foldr go [] dbItems
  where
    go x acc =
      case x of
        (DbNumber num) -> num : acc
        otherwise -> acc
```

3. Write a function that gets the most recent date.
```haskell
mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = undefined
```

**Ans**
```haskell
import Data.List (sort)

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = last . sort . filterDbDate
```

4. Write a function that sums all of the DbNumber values.
```haskell
sumDb :: [DatabaseItem] -> Integer
sumDb = undefined
```

**Ans**
```haskell
sumDb :: [DatabaseItem] -> Integer
sumDb = sum . map (fromIntegral) . filterDbNumber
```

5. 
```haskell
-- You'll probably need to use fromIntegral
-- to get from Integer to Double

avgDb :: [DatabaseItem] -> Double
avgDb = undefined
```

**Ans**
```haskell
avgDb :: [DatabaseItem] -> Double
avgDb dbItems = sumNumbers / (fromIntegral totalNumbers)
  where
      sumNumbers = sum . map (fromIntegral) . filterDbNumber $ dbItems
      totalNumbers = length . filterDbNumber $ dbItems
```