module Main where

import Text.Trifecta

parseIntegerTillEnd :: Parser Integer
parseIntegerTillEnd = do
  i <- integer
  eof
  return i
