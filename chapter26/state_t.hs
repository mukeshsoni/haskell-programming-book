newtype StateT s m a =
  StateT { runStateT :: s -> m (a, s) }

// TODO - write main to test it out
// The program does type check, so i assumed it's written correctly
instance (Functor m)
  => Functor (StateT s m) where
  fmap f (StateT sma ) = StateT $ \s -> 
      fmap (\(a, s') -> (f a, s')) (sma s)
