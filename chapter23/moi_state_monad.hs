{-# LANGUAGE InstanceSigs #-}
newtype Moi s a =
    Moi { runMoi :: s -> (a, s) }

instance Functor (Moi s) where
    fmap :: (a -> b) -> Moi s a -> Moi s b
    fmap f m = Moi (\s -> (f $ fst (runMoi m s), s))

instance Applicative (Moi s) where
    pure x = Moi (\s -> (x, s))
    (<*>) fis m
        = Moi (\s -> let (f, s1) = runMoi fis s
                         (a, s2) = runMoi m s
                         in (f a, s2)
              )

instance Monad (Moi s) where
    return = pure
    (>>=) m f =
        Moi (\s -> let (a, s1) = runMoi m s1
                        in runMoi (f a) s1
            )
                    