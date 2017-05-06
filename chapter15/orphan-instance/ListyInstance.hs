module ListyInstance where

import Data.Monoid
import Listy

instance Monoid l => Monoid (Listy l) where
    mempty = Listy []
    mappend (Listy l1) (Listy l2) = Listy $ mappend l1 l2
