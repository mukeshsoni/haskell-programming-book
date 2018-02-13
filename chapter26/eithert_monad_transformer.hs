newtype EitherT e m a =
    EitherT { runEitherT :: m (Either e a) }

instance Functor m => Functor (EitherT e m)  where
    fmap f (EitherT etm) = EitherT $ (fmap . fmap) f etm

instance Applicative m => Applicative (EitherT e m) where
    pure x = EitherT $ (pure . pure) x
    (EitherT f) <*> (EitherT g) =
        EitherT $ (<*>) <$> f <*> g

instance Monad m => Monad (EitherT e m) where
    return = pure
    (EitherT etm) >>= f =
        EitherT $ do
            m <- etm
            case m of
                Left e -> pure (Left e)
                Right a ->
                    runEitherT (f a)