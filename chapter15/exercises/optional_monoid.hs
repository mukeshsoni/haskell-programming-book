import Data.Monoid

data Optional a = 
    Nada
  | Only a
    deriving (Eq, Show)
    
instance Monoid a => Monoid (Optional a) where
  mempty = Nada
  mappend Nada Nada = Nada
  mappend a Nada = a
  mappend Nada a = a
  mappend (Only a) (Only b) =
    Only (mappend a b)