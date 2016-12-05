1. Give the following datatype:

```haskell
data Weekday =
      Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday
```

we can say:

a) `Weekday` is a type with five data constructors

b) `Weekday` is a tree with five branches

c) `Weekday` is a product type

d) `Weekday` takes five arguments

**Ans**
(a)

2. and with the same datatype definition in mind, what is the type of the following function, `f`?
```haskell
f Friday = "Miller Time"
```

a) f :: [Char]

b) f :: String -> String

c) f :: Weekday -> String

d) f :: Day -> Beer

**Ans**
(c)

3. Types defined with the `data` keyword

a) must have at least one argument

b) must begin with a capital letter

c) must be polymorphic

d) cannot be imported from modules

**Ans**
(b)

4. The function `g xs = xs !! (length xs - 1)`

a) is recursive and may not terminate

b) delivers the head of `xs`

c) delivers the final element of `xs`

d) has the same type as `xs`

**Ans**
(c)
