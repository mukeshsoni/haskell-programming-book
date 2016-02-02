import Control.Monad
import System.Exit (exitSuccess)
import Data.Char

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  case (line1 == reverse line1) of
    True -> putStrLn "It's a palindarome!"
    False -> do
      putStrLn "Nope!"
      exitSuccess
      return ()


palindrome2 :: IO ()
palindrome2 = forever $ do
  line <- getLine
  case (isPalindrome line) of
    True -> putStrLn "It's a palindrome"
    False -> do
      putStrLn "Nope!"
      exitSuccess
      return ()

isPalindrome :: String -> Bool
isPalindrome s =
  let massaged = filter (`notElem` ".?!-;\'\"") $ map toLower (concat (words s)) in
    massaged == reverse massaged
