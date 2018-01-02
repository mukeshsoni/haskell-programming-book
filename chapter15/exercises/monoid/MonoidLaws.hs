module MonoidLaws where

import Data.Monoid
import Control.Monad
import Test.QuickCheck

monoidAssoc :: (Eq a, Monoid a) => a -> a -> a -> Bool
monoidAssoc a b c = a <> (b <> c) == (a <> b) <> c

monoidLeftIdentity :: (Eq a, Monoid a) => a -> Bool
monoidLeftIdentity a = mempty <> a == a

monoidRightIdentity :: (Eq a, Monoid a) => a -> Bool
monoidRightIdentity a = a <> mempty == a