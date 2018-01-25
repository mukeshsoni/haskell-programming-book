{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Monad (replicateM)
import Control.Monad.IO.Class (liftIO)
import qualified Data.ByteString.Char8 as BC
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
import qualified Data.Text.Lazy as TL
import qualified Database.Redis as R
import Network.URI (URI, parseURI)
import qualified System.Random as SR
import Web.Scotty

alphaNum :: String
alphaNum = ['A'..'Z'] ++ ['0'..'9']

randomElement :: String -> IO Char
randomElement s = do
  let maxIndex :: Int
      maxIndex = length s - 1
  randomDigit <- SR.randomRIO (0, maxIndex) :: IO Int
  return (s !! randomDigit)

shortyGen :: IO [Char]
shortyGen = replicateM 7 $ randomElement alphaNum

main :: IO ()
main = do
  putStrLn "hi sir"
