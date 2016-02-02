module Addition where

import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Addition" $ do
    it "1 + 2 is greater than 1" $ do
      (1 + 1) > 1 `shouldBe` True
    it "2 + 2 is equal to 4" $ do
      2 + 2 `shouldBe` 4

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go n d 0
  where go n d count
        | n < d = (count, n)
        | otherwise = go (n - d) d (count + 1)
