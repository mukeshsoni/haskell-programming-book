myLiftA2 :: Applicative f =>
        (a -> b -> c)
    ->  f a -> f b -> f c
myLiftA2 f m1 m2 = f <$> m1 <*> m2