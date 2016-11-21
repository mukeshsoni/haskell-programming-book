## Will it blow up?                

1. Will the following expression return a value or be `bottom`?                                                      
```haskell
[x^y | x <- [1..5], y <- [2, undefined]]
```

**Ans**
Be `bottom`

1. `take 1 $ [x^y | x <- [1..5], y <- [2, undefined]]`

**Ans**
It will not blow up

3. `sum [1, undefined, 3]`

**Ans**
Will blow


4. `length [1, 2, undefined]`

**Ans**
Won't blow

5. `length $ [1, 2, 3] ++ undefined`

**Ans**
Will blow

6. `take 1 $ filter even [1, 2, 3, undefined]`

**Ans**
Won't blow

7. `take 1 $ filter even [1, 3, undefined]`

**Ans**
Will blow

8. `take 1 $ filter odd [1, 3, undefined]`

**Ans**
Won't blow

9. `take 2 $ filter odd [1, 3, undefined]`

**Ans**
Won't blow

10. `take 3 $ filter odd [1, 3, undefined]`

**Ans**
Will blow