import Test.Hspec
import Lib

main = hspec $ do
	describe "digitToWord" $ do
		it "should return Zero for 0" $ do
	  		digitToWord 0 `shouldBe` "Zero"
		it "should return One for 0" $ do
	  		digitToWord 1 `shouldBe` "One"
	
	describe "digits" $ do
	 	it "should return [1] for 1" $ do
	   		digits 1 `shouldBe` [1]
		it "should return [1, 0, 0] for 100" $ do
			digits 100 `shouldBe` [1, 0, 0]

	describe "wordNumber" $ do
	 	it "should return One-Zero-Zero given 100" $ do
	   		wordNumber 100 `shouldBe` "One-Zero-Zero"
		it "should return Nine-Zero-Zero-One from 9001" $ do
	  		wordNumber 9001 `shouldBe` "Nine-Zero-Zero-One"
