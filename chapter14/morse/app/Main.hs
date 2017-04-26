module Main where

import Control.Monad (forever, when)
import Data.List (unwords)
import Data.Traversable (traverse)
import Morse (stringToMorse, morseToChar)
import System.Environment (getArgs)
import System.Exit (exitFailure, exitSuccess)
import System.IO (isEOF, hGetLine, hIsEOF, stdin)

f :: Char -> Int
f x = x + 1

main :: IO ()
main = do
    mode <- getArgs
    case mode of
      [arg] -> 
          case arg of
            "from" -> convertFromMorse
            "to"   -> convertToMorse
            _      -> argError
      _   -> argError

argError = do
    putStrLn "hey"
    exitFailure

convertToMorse :: IO ()
convertToMorse = forever $ do
    weAreDone <- isEOF
    when weAreDone exitSuccess

    line <- getLine
    convertLine line
    where
        convertLine line = do
            let morse = stringToMorse line
            case morse of
                (Just str) -> putStrLn (unwords str)
                Nothing    -> do
                    putStrLn $ "Error: " ++ line
                    exitFailure

convertFromMorse :: IO ()
convertFromMorse = forever $ do
    weAreDone <- isEOF
    when weAreDone exitSuccess

    morse <- getLine
    convertMorse morse
    where
        convertMorse morse = do
            let decoded :: Maybe String
                decoded = traverse morseToChar (words morse)
            case decoded of
                (Just str) -> putStrLn str
                Nothing    -> do
                    putStrLn $ "Error: " ++ morse
                    exitFailure

