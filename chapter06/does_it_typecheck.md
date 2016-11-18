# For this section of exercises, you’ll be practicing looking for type and typeclass errors.
For example, printIt will not work because functions like 𝑥 have no instance of Show, the typeclass that lets you convert things to Strings (usually for printing):
x :: Int -> Int x blah = blah + 20
printIt :: IO ()
printIt = putStrLn (show x)
Here’s the type error you get if you try to load the code:
No instance for (Show (Int -> Int)) arising
  from a use of ‘show’
In the first argument of ‘putStrLn’, namely ‘(show x)’

-----
Questions

1. Does the following code typecheck? If not, why not?

```haskell
data Person = Person Bool 
printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)
```

**Ans**

It will not typecheck since the Person type does not implement the `Show` typeclass.

2. Does the following typecheck? If not, why not?

```haskell
data Mood = Blah
          | Woot deriving Show
settleDown x = if x == Woot then Blah else x
```

**Ans** 

It will not typecheck since x cannot be equated with `Woot`. The type `Mood` does not implement the `Eq` typeclass.

3. If you were able to get settleDown to typecheck:

a) What values are acceptable inputs to that function?

b) What will happen if you try to run settleDown 9? Why?

c) What will happen if you try to run Blah > Woot? Why?

**Ans**

a) One way to get settleDown to typeCheck is by deriving the `Eq` typeclass for `Mood` type or implementing the `==` for `Mood`.

```haskell
data Mood = Blah | Woot deriving (Show, Eq)

-- OR

instance Eq Mood where
  (==) Blah Blah = True
  (==) Woot Woot = True
  (==) _ _ = False
```

And by definition of `==` both parameters to `==` should be the same type. Hence `x` has to be of type `Mood`

b) `settleDown 9` will throw an exception since we would be trying to compare a `Num` with `Mood`

c) `Blah > Woot` would throw an exception because the type `Mood` does not implement the `Ord` typeclass (or derive it)


4. Does the following typecheck? If not, why not?

```haskell
type Subject = String
type Verb = String
type Object = String

data Sentence =
  Sentence Subject Verb Object deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"
```

**Ans**

Yes, it will typecheck


## Given a datatype declaration, what can we do?

#### Given the following datatype definitions:

```haskell
data Rocks =
  Rocks String deriving (Eq, Show)

data Yeah =
  Yeah Bool deriving (Eq, Show)

data Papu =
  Papu Rocks Yeah deriving (Eq, Show)
```

Which of the following will typecheck? 

For the ones that don’t typecheck, why don’t they?

1. `phew = Papu "chases" True`

**Ans**
This will not typecheck since `"chases"` is a String. The first parameter to `Papu` data constructor 
has to be `Rocks` which can be constructed using the `Rocks` data constructor.

Same is true for the second parameter to `Papu`.

This will work - `phew = Papu (Rocks "chases") (Yeah True)`

2. `2. truth = Papu (Rocks "chomskydoz") (Yeah True)`

**Ans**

Yup, will typecheck.

3. 
```haskell
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'
```

**Ans**

Yup, will typecheck. Papu derives the `Eq` typeclass.

4. `comparePapus :: Papu -> Papu -> Bool comparePapus p p' = p > p'`

**Ans**

This will not typecheck. Using the `>` operator means `Papu` should have an instance for `Ord` typeclass, which it does not.

5. 