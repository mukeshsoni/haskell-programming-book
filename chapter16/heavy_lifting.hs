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
c = fmap (*2) (\x -> x - 2)

main = do
    putStrLn (show a)
    putStrLn (show b)
