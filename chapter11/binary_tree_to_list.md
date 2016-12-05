```haskell
data BinaryTree a = 
      Leaf
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)    
```


2. Convert binary trees to lists.

Write functions to convert `BinaryTree` values to lists. Make certain your implementation passes the tests.

```haskell
preorder :: BinaryTree a -> [a]
preorder = undefined

inorder :: BinaryTree a -> [a]
inorder = undefined

postorder :: BinaryTree a -> [a]
postorder = undefined

testTree :: BinaryTree Integer
testTree = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder = 
    if preorder testTree == [2, 1, 3]
    then putStrLn "Preorder fine!"
    else putStrLn "Bad news bears."

testInorder :: IO ()
testInorder =
    if inorder testTree == [1, 2, 3]
    then putStrLn "Inorder fine!"
    else putStrLn "Bad news bears."

testPostorder :: IO ()
testPostorder =
    if postorder testTree == [1, 3, 2]
    then putStrLn "Postorder fine!"
    else putStrLn "Bad news bears."

main :: IO ()
main = do
    testPreorder
    testInorder
    testPostorder
```

**Ans**
```haskell
preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left a right) =
  [a] ++ (preorder left) ++ (preorder right)
  
inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left a right) =
  (inorder left) ++ [a] ++ (inorder right)
  
postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node left a right) =
  (postorder left) ++ (postorder right) ++ [a]
```