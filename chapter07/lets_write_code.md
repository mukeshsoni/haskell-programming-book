1. The following function returns the tens digit of an integral argument.
```haskell
tensDigit :: Integral a => a -> a
tensDigit x = d
    where xLast = x `div` 10
          d = xLast `mod` 10
```

a) First, rewrite it using `divMod`

**Ans**
```haskell
tensDigit' x = (divMod 10) . fst . (divMod 10) $ x

-- OR, pointfree

tensDigit' x = snd . divMod10 . fst . divMod10 $ x
                where divMod10 = flip divMod $ 10
```

b) Does the divMod version have the same type as the original version?

**Ans**
Yes

c) Next, let’s change it so that we’re getting the hundreds digit instead.

**Ans**

```haskell
hunsD :: Integral a => a -> a
hunsD x = d
    where xLast = x `div` 100
          d = xLast `mod` 10
```

2. Implement the function of the type a -> a -> Bool -> a once each using a case expression and once with a guard.
```haskell
foldBool :: a -> a -> Bool -> a
foldBool = error "Error: Need to implement foldBool!"
```

The result is semantically similar to if-then-else expressions but syntactically quite different. Here is the pattern matching version to get you started:
```haskell
foldBool3 :: a -> a -> Bool -> a
foldBool3 x y True = x
foldBool3 x y False = y
```

**Ans**
```haskell
-- with case statement
foldBool :: a -> a -> Bool -> a
foldBool x y cond = 
    case cond of
       True -> x
       False -> y
       
-- with guards
foldBool' :: a -> a -> Bool -> a
foldBool' x y cond
  | cond = x
  | otherwise = y

-- tests
foldBool 'a' 'b' True
foldBool 'a' 'b' False

foldBool' 'a' 'b' True
foldBool' 'a' 'b' False
```

3. Fill in the definition. Note that the first argument to our function is also a function which can be applied to values. Your second argument is a tuple, which can be used for pattern matching:
```haskell
g :: (a -> b) -> (a, c) -> (b, c)
g = undefined
```

**Ans**
```haskell
g f (a, c) = (f a, c)
```

4. For this next exercise, you’ll experiment with writing pointfree versions of existing code. This involves some new information, so read the following explanation carefully.

Typeclasses are dispatched by type. Read is a typeclass like Show, but it is the dual or “opposite” of Show. In general, the Read typeclass isn’t something you should plan to use a lot, but this exercise is structured to teach you something about the interaction between typeclasses and types.
The function read in the Read typeclass has the type:
```haskell
read :: Read a => String -> a
```

Notice a pattern?
```haskell
read :: Read a => String -> a
show :: Show a => a -> String
```

Write the following code into a source file. Then load it and run it in GHCi to make sure you understand why the evaluation results in the answers you see.
```haskell
-- arith4.hs
module Arith4 where
-- id :: a -> a
-- id x = x
roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)
main = do
    print (roundTrip 4)
    print (id 4)
```

**Ans**

Yup.

5. Next, write a pointfree version of `roundTrip`. (n.b., this refers to the function definition, not to its application in main)

**Ans**
```haskell
roundTrip = read . show
```

6. We will continue to use the code in module Arith4 for this exercise as well.
When we apply show to a value such as `(1 :: Int)`, the `𝑎` that implements `Show` is `Int`, so GHC will use the `Int` instance of the `Show` typeclass to stringify our `Int` of 1. However, `read` expects a `String` argument in order to return an `𝑎`. The `String` argument that is the first argument to `read` tells the function nothing about what type the de-stringified result should be. In the type signature roundTrip currently has, it knows because the type variables are the same, so the type that is the input to show has to be the same type as the output of read.
Your task now is to change the type of roundTrip in Arith4 to `(Show a, Read b) => a -> b`. How might we tell GHC which instance of `Read` to dispatch against the `String` now? Make the expression `print (roundTrip 4)` work. You will only need the *"has the type"*
syntax of `::` and parentheses for scoping.

**Ans**
```haskell
print (roundTrip 4 :: Int)
```