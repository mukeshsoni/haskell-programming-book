-- you’re trying to fill in terms (code) which’ll fit the type. 
-- The idea with these exercises is that you’ll derive the implementation from the type information.

-- 1. implement chk
-- chk = ??
chk :: Eq b => (a -> b) -> a -> b -> Bool

-- Ans 
chk f x y = f x == y 

-- 2. -- Hint: use some arithmetic operation to
-- combine values of type 'b'. Pick one.
-- arith = ???

arith :: Num b => (a -> b) -> Integer -> a -> b 

-- solution 1, but it's lame
arith f x y = f y

-- solution 2
arith f x y = if x > 0 then f y + 10 else f y - 10