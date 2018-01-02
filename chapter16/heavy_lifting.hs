-- Instructions
-- Add fmap, parentheses, and function composition to the expression
-- as needed for the expression to typecheck and produce the 
-- expected result.

-- 1. a = (+1) $ read "[1]" :: [Int]
a :: [Int]
a = fmap (+1) $ (read "[1]" :: [Int])

-- 2. b = (++ "lol") (Just ["Hi,", "Hello"])
-- Expected value of b is Just ["Hi,lol", "Hellolol"]
b :: Maybe [ String ]
b = (fmap . fmap) (++ "lol") (Just ["Hi", "Hello"])

-- 3. c = (*2) (\x -> x - 2)
-- Preluce> c 1
-- -2
-- Solution Note - This one is tricky since the fmap is happening over the function functor (yes, no typo there)
c :: Integer -> Integer
c = fmap (*2) (\x -> x - 2)

-- 4. d = ((return "1" ++) . show) (\x -> [x, 1..3]) 
-- Prelude> d 0
-- 1[0, 1, 2, 3]
d :: Integer -> String
d = fmap (("1" ++) . show) (\x -> [x, 1..3])

-- 5. e :: IO Integer
-- e = let ioi = readIO "1" :: IO Integer
--         changed = read ("123" ++) show ioi
--     in (*3) changed
-- Prelude> e
-- 3693
e :: IO Integer
e = let ioi = (readIO "1" :: IO Integer)
        changed = fmap (read . ("123" ++) . show) ioi
    in fmap (*3) changed

main :: IO Integer
main = do
    print a
    print b
    print (c 1)
    print (d 0)
    e
