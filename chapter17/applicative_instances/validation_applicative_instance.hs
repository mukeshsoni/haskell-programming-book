import Data.Monoid

data Validation e a =
    Failure e
  | Success a
  deriving (Eq, Show)

instance Functor (Validation e) where
    fmap _ (Failure e) = Failure e
    fmap f (Success a) = Success (f a)

instance (Monoid e) => Applicative (Validation e) where
    pure = Success
    (<*>) (Failure x) (Failure y) = Failure (x <> y)
    (<*>) (Failure x) (Success _) = Failure x
    (<*>) (Success _) (Failure y) = Failure y
    (<*>) (Success f) (Success b) = Success (f b)
