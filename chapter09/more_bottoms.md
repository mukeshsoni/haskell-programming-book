1. Will the following expression return a value or be `bottom`?
```haskell
take 1 $ map (+1) [undefined, 2, 3]
```

**Ans** `bottom`

2. Will the following expression return a value or be `bottom`?
```haskell                                                
take 1 $ map (+1) [1, undefined, 3]
```

**Ans**
Return a value

3. Will the following expression return a value or be `bottom`?
```haskell
take 2 $ map (+1) [1, undefined, 3]
```

**Ans**
`bottom`

4. What does the mystery function do? What is it's type? Describe it (to yourself or a loved one) in standard English and then test it out in the REPL to make sure you were correct
```haskell
itIsMystery xs = map (\x -> elem x "aeiou") xs
```

**Ans**
The function take a string and return a list of boolean. The boolean in a particular position say whether the letter in that position in the string is a vowel or not.

5. What will be the result of the following functions:
```
map (^2) [1..10]
map minimum [[1..10], [10..20], [20..30]] 
-- n.b. `minimum` is not the same function 
-- as the `min` that we used before
map sum [[1..5], [1..5], [1..5]]
```

**Ans**

```haskell
map (^2) [1..10]
-- [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

map minimum [[1..10], [10..20], [20..30]]
-- [1, 10, 20]

map sum [[1..5], [1..5], [1..5]]
-- [15, 15, 15]
```

6. Back in the Functions chapter, you wrote a function call `foldBool`. That function exists in a module known as `Data.Bool` and is called `bool`. Write a function that does the same (or similar, if you wish) as the map (if-then-else) function you saw above (given below) but use `bool` instead of the `if-then-else` syntax. Your first step should be bringing the `bool` function into scope by typing `import Data.Bool` at your Prelude prompt: 

The function talked about above - 
```haskell
map (\x -> if x == 3 then (-x) else (x)) [1..10]
```

**Ans**
```haskell
import Data.Bool

map (\x -> bool (-x) x (x==3)) [1..10]
```