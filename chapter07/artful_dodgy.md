Given the following definitions tell us what value results from further applications. When you’ve written down at least some of the answers and think you know what’s what, type the definitions into a file and load them in GHCi to test your answers.

-- Types not provided, try filling them in yourself.

```haskell
dodgy x y = x + y * 10 
oneIsOne = dodgy 1 
oneIsTwo = (flip dodgy) 2
```

1. Given the expression dodgy 1 0, what do you think will happen if we evaluate it?

**Ans**

1


2. `dodgy 1 1`

**Ans**

11

3. `dodgy 2 2`

**Ans**

22


4. `dodgy 1 2`

**Ans**

21

5. `dodgy 2 1`

**Ans**

12

6. `oneIsOne 1`

**Ans**

11

7. `oneIsOne 2`

**Ans**

21

8. `oneIsTwo 1`

**Ans**

21

9. `oneIsTwo 2`

**Ans**

22

10. `oneIsOne 3`

**Ans**

31

11. oneIsTwo 3

**Ans**

23
