For the following set of exercises, you are not expected to use folds. These are intended to review material from previous chapters. Fell free to use any syntax or structure from previous chapters that seem appropriate.

1. Given the following sets of consonants and vowels:
```haskell
stops = "pbtdkg"
vowels = "aeiou"
```

a) Write a function that takes inputs from `stops` and `vowels` and makes 3-tuples of all possible stop-vowel-stop combinations. These will not all correspond to real words in English, although the stop-vowel-stop patterns is common enough that many of them will.

**Ans**
```haskell
stopVowelStop = [(s1, v, s2) | s1 <- stops, v <- vowels, s2 <- stops]
```

b) Modify the function so that it only returns the combinations that begin with a `p`.

**Ans**
```haskell
stopVowelStopStartP = [(s1, v, s2) | s1 <- stops, v <- vowels, s2 <- stops, s1 == 'p']
```

c) [TODO]
Now setup lists of nouns and verbs (instead of `stops` and 'vowels`) and modify the function to make tuples representing possible noun-verb-noun sentences.

**Ans**
[TODO]

2) What does the following mystery function do? What is it's type? Try to get a good sense of what it does before you test it in the REPL to verify it.

```haskell
seekritFunc x = 
    div (sum (map length (words x)))
        (length (words x))
```

**Ans**
The `seekritFunc` tells us the average length of a word in a string.

3) We'd really like the answer to be more precise. Can you rewrite that using fractional division?

**Ans**
```haskell
seekritFunc' x = 
  (sum . (map fromIntegral) . (map length) $  (words x)) / (fromIntegral . length $ words x)
```