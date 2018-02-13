{-# LANGUAGE InstanceSigs #-}

newtype Compose f g a = 
    Compose { runCompose :: f (g a) }
    deriving (Eq, Show)

instance (Functor f, Functor g) =>
    Functor (Compose f g) where
    
    fmap :: (a -> b)
         -> Compose f g a
         -> Compose f g b
    fmap f (Compose fga) = Compose $ (fmap . fmap) f fga

instance (Applicative f, Applicative g) =>
    Applicative (Compose f g) where
    pure :: a -> Compose f g a
    pure x = Compose $ (pure . pure) x

    (<*>) :: Compose f g (a -> b)
          -> Compose f g a
          -> Compose f g b
    -- NOTE - the implementation is crazy. It's a one liner but makes you sweat
    (Compose f) <*> (Compose a) =
        Compose $ ((<*>) <$> f) <*> a