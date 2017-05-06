module MaybeMonoid where
  
import Data.Monoid

data Optional a = 
    Nada
  | Only a
    deriving (Eq, Show)
    
instance Monoid a => Monoid (Optional a) where
  mempty = Nada
  mappend Nada _ = Nada
  mappend _ Nada = Nada
  mappend (Only a) (Only b) =
    Only (mappend a b)
    
