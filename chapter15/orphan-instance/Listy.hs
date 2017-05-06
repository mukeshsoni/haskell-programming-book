module Listy where

import Data.Monoid

newtype Listy a = Listy [a] deriving (Eq, Show)

instance Monoid l => Monoid (Listy l) where
    mempty = Listy []
    mappend (Listy l1) (Listy l2) = Listy $ mappend l1 l2

