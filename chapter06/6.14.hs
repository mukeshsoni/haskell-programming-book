-- Multiple choice questions

1. The Eq class
    a) includes all types in Haskell 
    b) is the same as the Ord class
    c) makes equality tests possible 
    d) only includes numeric types

Ans - (c)

2. The typeclass Ord

    a) allows any two values to be compared 
    b) is a subclass of Eq
    c) is a superclass of Eq
    d) has no instance for Bool

Ans - (b)

3. Suppose the typeclass Ord has an operator >. What is the type of >?

    a) Ord a => a -> a -> Bool 
    b) Ord a => Int -> Bool
    c) Ord a => a -> Char
    d) Ord a => Char -> [Char]

Ans - (a)

4. In x = divMod 16 12

    a) the type of 𝑥 is Integer
    b) the value of 𝑥 is undecidable
    c) the type of 𝑥 is a tuple 
    d) 𝑥 is equal to 12 / 16

Ans - (c)

5. The typeclass Integral includes
    
    a) Int and Integer numbers
    b) integral, real, and fractional numbers
    c) Schrodinger’s cat
    d) only positive numbers

Ans - (a) -- hint - try `:info Integral` in the repl