```haskell
Prelude> filter (\x -> (rem x 2) == 0) [1..20]
[2,4,6,8,10,12,14,16,18,20]
```
1. Given the above, how might we write a fitler function that would give us all the multiples of 3 out of a list from 1-30?

**Ans**
  
```haskell
filter (\x -> rem x 3 == 0) [1..30]
``

2. Recalling what we learned about function composition, how could we compose the above function with the length function to tell us *how many* multiples of 3 are between 1 and 30?

**Ans**
30

```haskell
length $ filter (\x -> rem x 3 == 0) [1..30]
```

3. Next we're going to work on removing all articles ('the', 'a' and 'an') from sentences. You want to get to something that works like this:

```haskell
Prelude> myFilter "the brown dog was a goof"
["brown","dog","was","goof"]
```

**Ans**

```haskell
myFilter :: String -> [String]
myFilter s = filter (\w -> not $ elem w ["the", "a", "an"]) $ words s
```

