```haskell
avgGrade :: (Fractional a, Ord a) => a -> Char avgGrade x
    | y >= 0.9 ='A' 
    | y >= 0.8 ='B' 
    | y >= 0.7 ='C' 
    | y >= 0.59 = 'D' 
    | y < 0.59 = 'F' 
    where y = x / 100
```

1. It is probably clear to you why you wouldn’t put an otherwise in your top-most guard, but try it with avgGrade anyway and see what happens. It’ll be more clear if you rewrite it as an actual otherwise match: | otherwise = 'F'. What happens now if you pass a 90 as an argument? 75? 60?

**Ans**

The function returns 'F' for all cases.

2. What happens if you take avgGrade as it is written and reorder the guards? Does it still typecheck and work the same? Try moving | y >= 0.7 = 'C' and passing it the argument 90, which should be an ‘A.’ Does it return an ‘A’?

**Ans**

Yes, it still type checks.

Nope, it will return `'C'` if the condition comes before the condition for `'A'` and input is 90

3. The following function returns
```haskell
pal xs
    | xs == reverse xs = True 
    | otherwise = False
```

a) xs written backwards when it’s True 
b) True when xs is a palindrome
c) False when xs is a palindrome 
d) False when xs is reversed

**Ans**

(b)

4. What types of arguments can pal take?

**Ans**

Lists of any type

5. What is the type of the function pal?

**Ans**
```haskell
pal :: [a] - > Bool
```

6. The following function returns
```haskell
numbers x
    | x < 0 = -1
    | x == 0 = 0 
    | x > 0 = 1
```

a) the value of its argument plus or minus 1 
b) the negation of its argument
c) an indication of whether its argument is a positive or nega- tive number or zero
d) binary machine language

**Ans**

(c)

7. What types of arguments can numbers take?

**Ans**

(Num a, Ord a, Eq a) => a

Any type which has instances for `Num`, `Ord` and `Eq` typeclasses

8. What is the type of the function numbers?

**Ans**

```haskell
numbers :: (Ord a, Eq a) => a -> Int
``` 