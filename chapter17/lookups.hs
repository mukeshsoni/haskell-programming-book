-- Use one or ore of the following terms to make the expressions type check
-- pure
-- (<$>)
-- (<*>)

-- 1
-- added :: Maybe Integer
-- added = (+3) (lookup 3 $ zip [1, 2, 3] [4, 5, 6])
added :: Maybe Integer
added = (+3) <$> (lookup 3 $ zip [1, 2, 3] [4, 5, 6])

-- 2
y :: Maybe Integer
y = lookup 3 $ zip [1, 2, 3] [4, 5, 6]

z :: Maybe Integer
z = lookup 2 $ zip [1, 2, 3] [4, 5, 6]

-- tupled :: Maybe (Integer, Integer)
-- tupled = (,) y z
tupled :: Maybe (Integer, Integer)
tupled = (,) <$> y <*> z


