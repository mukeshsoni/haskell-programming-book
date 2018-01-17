import Control.Applicative (liftA3)

stops :: String
stops = "pbdtkg"

vowels :: String
vowels = "aeiou"

combos :: [a] -> [b] -> [c] -> [(a, b, c)]
combos = liftA3 (,,)

combosStartsWithP l1 l2 l3 = filter (\(a, b, c) -> a == 'p') $ combos l1 l2 l3