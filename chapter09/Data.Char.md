These first few exercises are straightforward but will introduce you to some new library functions and review some of what we've learned so far. Some of the functions we will use here are not standard in Predlue and so have to be imported from a module called Data.Char. You may do so in a source file (recemmended) or at the Prelude prompt with the same phrase: `import Data.Char` (write that at the top of your source file). This brings into scope a bunch of new standard functions we can play with that operate on Char and String types.

1. Query the types of `isUpper` and `toUpper`

**Ans**

```haskell
Prelude> import Data.Char
```

```haskell
Prelude Data.Char> :i isUpper
isUpper :: Char -> Bool 	-- Defined in ‘GHC.Unicode’

Prelude Data.Char> :i toUpper
toUpper :: Char -> Char 	-- Defined in ‘GHC.Unicode’
```

2. Given the following behaviors, which would we use to write a function that filters all the uppercase letters out of a `String`? Write that function such that, given the input 'HbEfLrLxO," your function will return "HELLO"

```haskell 
filterUpper = filter isUpper
```

3. Write a function that will capitalize the first letter of a `String` and return the entire `String`. For example, if given the argument "julie", it will return "Julie"

```haskell
upperFirst [] = ""
upperFirst (x:xs) = toUpper x : xs
```

4. Now make a new version of that function that is recursive such that if you give it the input "woot" it will holler back at you "WOOT". The type signature won't change, but you will want to add a base case.

```haskell
upperAll [] = ""
upperAll (x:xs) = toUpper x : upperAll xs
```

5. To do the final exercise in this section, we'll need another standard function for lists called `head`. Query the type of `head` and experiment with it to see what it does. Now write a function that will capitalize the first letter of a `String` and return only that letter as the result.

```haskell
upperFirstChar [] = ''
upperFirstChar s = toUpper (head s)
```

6. Cool. Good work. Now rewrite it as a composed function. Then for fun, rewrite it pointfree.

```haskell
upperFirstChar [] = ''
upperFirstChar s = toUpper . head $ s

-- pointfree
upperFirstChar [] = ''
upperFirstChar = toUpper . head
```