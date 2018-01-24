bind :: Monad m => (a -> mb) -> m a -> m b
bind = join . fmap