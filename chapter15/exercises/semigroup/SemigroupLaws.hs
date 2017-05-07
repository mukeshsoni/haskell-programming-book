module SemigroupLaws where

import Data.Semigroup

assocLaw :: (Eq m, Semigroup m) => m -> m -> m -> Bool
assocLaw a b c = a <> (b <> c) == (a <> b) <> c

