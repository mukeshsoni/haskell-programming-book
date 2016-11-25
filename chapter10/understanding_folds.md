1.
```haskell
foldr (*) 1 [1..5]
```

will return the same result as which of the following:                                                      
a) flip (*) 1 [1..5]

b) foldl (flip (*)) 1 [1..5]

c) foldl (*) 1 [1..5]

**Ans**
(b) && (c)

2. Write out the evaluation steps for `foldl (flip (*)) 1 [1..3]`

**Ans**
```haskell
(* 3 (* 2 (* 1 1)))
(* 3 (* 2 1))
(* 3 2)
6
```

3. One difference between foldr and foldl is:

a) foldr, but not foldl, traverses the spine fo a list from right to left

b) foldr, but not foldl, always fores the rest of the fold

c) foldr, but not foldl, associates to the right

d) foldr, but not foldl, is recursive

**Ans**
(c)

4. Folds are catamorphisms, which means they are generally used to

a) reduce structure

b) expand structure

c) render you catatonic

d) generate infinite data structures

**Ans**
(a)

5. The following are simple folds very similar to what you've already seen, but each has at least one error. Please fix them and test in our REPL:

a) `foldr (++) ["woot", "WOOT", "woot"]`

**Ans**
```haskell
`foldr (++) "" ["woot", "WOOT", "woot"]`
```

b) `foldr max [] "fear is the little death"`

**Ans**
```haskell
foldr max 'a' "fear is the little death"`
```

c) foldr and True [False, True]

**Ans**
```haskell
foldr (&&) True [False, True]

-- OR

and [False, True]
```

d) This one is more subtle than the previous. Can it ever return a different result?
```haskell
foldr (||) True [False, True]
```

**Ans**
It can return bottom if the input list is something like `[undefined]` or `["hey"]`.

For all input lists of `Bool`, it will always return `True`

e) `foldl ((++) . show) "" [1..5]`

**Ans**
```haskell
foldl (flip ((++) . show)) "" [1..5]
```

f)
`foldr const 'a' [1..5]`

**Ans**
```haskell
foldr (flip const) 'a' [1..5]

-- OR
foldr const 1 [1..5]
```

g)
`foldr const 0 "tacos"`

**Ans**
```haskell
foldr (flip const) 1 "tacos"

-- OR 
foldr const 'a' "tacos"
```

h)
`foldl (flip const) 0 "burritos"`

**Ans**
```haskell
foldl const 0 "burritos"

-- OR
foldl (flip const) 'a' "burritos"
```

i)
`foldl (flip const) 'z' [1..5]`

**Ans**
```haskell
foldl const 'z' [1..5]

-- OR

foldl (flip const) 1 [1..5]
```
