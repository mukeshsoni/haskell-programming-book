-- Write the following functions using the methods provided
-- by Functor and Monad. Using stuff like identity and composition
-- is fine, but it has to typecheck with types provided.

-- 1. 
-- j :: Monad m => m (m a) -> m a
-- this is actually similar to join
j :: Monad m => m (m a) -> m a
j m = m >>= id

-- 2.
-- l1 :: Monad m => (a -> b) -> m a -> m b
l1 :: Monad m => (a -> b) -> m a -> m b
l1 = fmap

-- 3.
-- l2 :: Monad m => (a -> b -> c) -> m a -> m b -> m c
l2 :: Monad m => (a -> b -> c) -> m a -> m b -> m c
l2 f m1 m2 = do
    a <- m1
    b <- m2
    return (f a b)

-- 4.
-- a :: Monad m => m a -> m (a -> b) -> m b
a :: Monad m => m a -> m (a -> b) -> m b
a m1 mf = do
    a <- m1
    f <- mf
    return (f a)

-- 5.
-- You will need recursion for this
-- meh :: Monad m => [m a] -> (a -> m b) -> m [b]
meh [] _ = return []
meh (x:xs) f = do
    a <- x
    b <- meh xs f
    return ((f a) : b)

-- 6.
-- Hint: reuse 'meh'
-- flipType :: Monad m => [m a] -> m [a]
flipType l = meh l id