-- src/Main.hs

module Main where

import Control.Monad (forever)
import Data.Char (toLower)
import Data.Maybe (isJust)
import Data.List (intersperse)
import System.Exit (exitSuccess)
import System.Random (randomRIO)

type WordList = [String]

allWords :: IO WordList
allWords = do
  dict <- readFile "data/dict.txt"
  return (lines dict)

minWordLength :: Int
minWordLength = 4

maxWordLength :: Int
maxWordLength = 7

gameWords :: IO WordList
gameWords = do
  aw <- allWords
  return (filter gameLength aw)
  where gameLength w =
          let l = length (w :: String)
          in l > minWordLength && l < maxWordLength

randomWord :: WordList -> IO String
randomWord wl = do
  randomIndex <- randomRIO (0, length wl - 1)
  return $ wl !! randomIndex

randomWord' = gameWords >>= randomWord

data Puzzle = Puzzle String [Maybe Char] String

instance Show Puzzle where
  show (Puzzle _ discovered guessed) =
    intersperse ' ' (fmap renderPuzzleChar discovered)
    ++ " Guessed so far: " ++ guessed

freshPuzzle :: String -> Puzzle
freshPuzzle w = Puzzle w (nothingDiscovered w) []

nothingDiscovered = map (const Nothing)

charInWord :: Puzzle -> Char -> Bool
charInWord (Puzzle s _ _) c = c `elem` s

alreadyGuessed :: Puzzle -> Char -> Bool
alreadyGuessed (Puzzle _ _ guessed) c = c `elem` guessed

renderPuzzleChar Nothing = '_'
renderPuzzleChar (Just c) = c

fillInCharacter :: Puzzle -> Char -> Puzzle
fillInCharacter (Puzzle word filledInSoFar s) c =
  Puzzle word newFilledInSoFar (c : s)
  where zipper guessed wordChar guessChar =
          if wordChar == guessed
          then Just wordChar
          else guessChar

        newFilledInSoFar = zipWith (zipper c) word filledInSoFar

totalAttempts :: Int
totalAttempts = 7

attemptsLeft :: Puzzle -> String
attemptsLeft puzzle = show (totalAttempts - wrongAttempts puzzle)

handleGuess :: Puzzle -> Char -> IO Puzzle
handleGuess puzzle guess = do
  putStrLn $ "Your guess was: " ++ [guess]
  case (charInWord puzzle guess, alreadyGuessed puzzle guess) of
    (_, True) -> do
      putStrLn ("You already guessed that character, pick another one. Attempts left: " ++ attemptsLeft puzzle)
      return puzzle
    (True, _) -> do
      putStrLn ("This character was in the word. Well done! Attempts left: " ++ attemptsLeft puzzle)
      return (fillInCharacter puzzle guess)
    (False, _) -> do
      putStrLn ("This character is not in the puzzle word. Attempts left: " ++ attemptsLeft puzzle)
      return (fillInCharacter puzzle guess)

wrongAttempts :: Puzzle -> Int
wrongAttempts (Puzzle _ filledInSoFar guessed) =
  length guessed - length (filter isJust filledInSoFar)

gameOver :: Puzzle -> IO ()
gameOver puzzle@(Puzzle wordToGuess filledInSoFar guessed) =
  if wrongAttempts puzzle > 7 then
    do putStrLn "That's it mate. Game over for you!"
       putStrLn $ "If you are curious, the word was: " ++ wordToGuess
       exitSuccess
  else return ()

gameWin :: Puzzle -> IO ()
gameWin (Puzzle _ filledInSoFar _) =
  if all isJust filledInSoFar then
    do putStrLn "You win! Well done, sir!"
       exitSuccess
  else return ()

runGame :: Puzzle -> IO ()
runGame puzzle = forever $ do
  gameOver puzzle
  gameWin puzzle
  putStrLn $ "Current puzzle is: " ++ show puzzle
  putStr "Guess a letter: "
  guess <- getLine
  case guess of
    [c] -> handleGuess puzzle c >>= runGame
    _ -> putStrLn "Your guess must be a single character"

main :: IO ()
main = do
  word <- randomWord'
  let puzzle = freshPuzzle (fmap toLower word)
  runGame puzzle
