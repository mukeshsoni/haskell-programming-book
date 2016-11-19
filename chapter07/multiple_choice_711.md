1. A polymorphic function

a) changes things into sheep when invoked

b) has multiple arguments

c) has a concrete type

d) may resolve to values of different types, depending on inputs

**Ans**
(d)

2. Two functions named f and g have types `Char -> String` and
`String -> [String]` respectively. The composed function `g . f`
has the type

a) Char -> String

b) Char -> [String]

c) [[String]]

d) Char -> String -> [String]

**Ans**
(b)

3. A function f has the type `Ord a => a -> a -> Bool` and we apply it to one numeric value. What is the type now?

a) Ord a => a -> Bool

b) Num -> Num -> Bool

c) Ord a => a -> a -> Integer

d) (Ord a, Num a) => a -> Bool

**Ans**
(d)

4. A function with the type `(a -> b) -> c`

a) requires values of three different types

b) is a higher-order function

c) must take a tuple as its first argument

d) has its parameters in alphabetical order

**Ans**
(b)

5. Given the following definition of `f`, what is the type of `f True`?
```haskell
f :: a -> a
f x = x
```

a) f True :: Bool

b) f True :: String

c) f True :: Bool -> Bool

d) f True :: a

**Ans** 
(a)

