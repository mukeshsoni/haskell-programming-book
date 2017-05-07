module AssociativityLawProp where

assocLaw :: (Eq a, Monoid a) => a -> a -> a -> Bool
assocLaw a b c = a <> (b <> c) == (a <> b) <> c
