Write `map` for `BinaryTree'.

```haskell
data BinaryTree a = 
      Leaf
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)    

    
insert' :: Ord a => a -> BinaryTree a -> BinaryTree a
insert' x Leaf = Node Leaf x Leaf
insert' a (Node leftTree b rightTree)
  | a == b = Node leftTree b rightTree
  | a < b = Node (insert' a leftTree) b rightTree
  | otherwise = Node leftTree b (insert' a rightTree)
```

Given the definition of `BinaryTree` above, write a map function for the data structure. You don't really need to know anything about binary trees to write these functions. The structure inherent in the definition of the type is all you need. Just write the recursive functions and get it done.

No special algorithms are needed, and we don't expect you to keep the tree balanced or ordered. Also, remember that we've never once mutated anything. We've only built new values from input data. Given that, when you go to implement `mapTree`, you are not changing an existing tree - you're building a new one based on an existing one (just like when you are mapping functions over lists).

```haskell 
-- filling in some details to help you along
-- Note, you do *not* need to use insert' for this. Retain the original structure of the tree

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) =
    Node undefined undefined undefined

testTree' :: BinaryTree Integer
testTree' =
    Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapExpected = 
    Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)
mapOkay = 
    if mapTree (+1) testTree' == mapExpected
    then print "yup, okay!"
    else error "test failed!"
```

**Ans**
```haskell
mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) 
  = Node (mapTree f left) (f a) (mapTree f right)
```
