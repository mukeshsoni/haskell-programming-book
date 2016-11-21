1. Using takeWhile and dropWhile, write a function that takes a string and returns a list of strings, using spaces to separate the elements of the string into words, as in the following sample:

```haskell
*Main> myWords "all i wanna do is have some fun"
["all","i","wanna","do","is","have","some","fun"]
```

**Ans**

```haskell
split' s = go s []
  where
    go s l
      | length s == 0 = l
      | otherwise = go ((drop 1) $ dropWhile (/= ' ') s) (l ++ [takeWhile (/= ' ') s])
```

2. Next, write a function that takes a string and returns a list of strings, using newline separators to break up the string as in the following (your job is to fill in the undefined function):
```haskell
module PoemLines where
firstSen = "Tyger Tyger, burning bright\n" 
secondSen = "In the forests of the night\n" 
thirdSen = "What immortal hand or eye\n" 
fourthSen = "Could frame thy fearful symmetry?" 
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen

-- putStrLn sentences -- should print
-- Tyger Tyger, burning bright
-- In the forests of the night
-- What immortal hand or eye
-- Could frame thy fearful symmetry?
-- Implement this

myLines :: String -> [String] 
myLines = undefined

-- What we want 'myLines sentences' to equal
shouldEqual =
    [ "Tyger Tyger, burning bright"
    , "In the forests of the night"
    , "What immortal hand or eye"
    , "Could frame thy fearful symmetry?" ]
```

**Ans**

```haskell
split'' s separator = go s []
  where
    go s l
      | length s == 0 = l
      | otherwise = go ((drop 1) $ dropWhile (/= separator) s) (l ++ [takeWhile (/= separator) s])
```

3. Now let’s look at what those two functions have in common. Try writing a new function that parameterizes the character you’re breaking the string argument on and rewrite myWords and myLines using it.

**Ans**

Already did that as answer to question (2)