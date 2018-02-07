module Main where

import Text.Trifecta
import Text.Parser.Combinators

stop :: Parser a
stop = unexpected "stop"

one :: Parser Char
one = char '1'
two = char '2'
three = char '3'

one' = one >> stop

oneTwo :: Parser Char
oneTwo = char '1' >> char '2'

oneTwo' = oneTwo >> stop

testParse :: Parser Char -> IO ()
testParse p =
  print $ parseString p mempty "123"

testEOF :: Parser () -> IO ()
testEOF p =
  print $ parseString p mempty "123"

testString' :: Parser String -> IO ()
testString' p =
  print $ parseString p mempty "123"

oneString :: Parser String
oneString = string "1"

oneTwoString :: Parser String
oneTwoString = string "12"

oneTwoThreeString :: Parser String
oneTwoThreeString = string "123"

-- oneTwoThreeString' :: Parser String
-- oneTwoThreeString' = string "123" <|> string "12" <|> string "1"

pNL s =
  putStrLn ('\n' : s)

main :: IO ()
main = do
  pNL "stop:"
  testParse stop
  pNL "one:"
  testParse one
  pNL "one':"
  testParse one'
  pNL "oneTwo:"
  testParse oneTwo
  pNL "oneTwo':"
  testParse oneTwo'
  pNL "oneTwoStop:"
  testEOF (oneTwo >> eof)
  pNL "oneString"
  testString' oneString
  pNL "oneTwoString"
  testString' oneTwoString
  pNL "oneTwoThreeString"
  testString' oneTwoThreeString
  pNL "oneTwoThreeString'"
  testString' $ choice [oneTwoThreeString, oneTwoString, oneString]
  pNL "oneTwoThreeChar'"
  testParse $ choice [one >> two >> three, one >> two, one]
