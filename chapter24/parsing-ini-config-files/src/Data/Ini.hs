{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}

module Data.Ini where

import Control.Applicative
import Data.ByteString (ByteString)
import Data.Char (isAlpha)
import Data.Map (Map)
import qualified Data.Map as M
import Data.Text (Text)
import qualified Data.Text.IO as TIO
import Test.Hspec
import Text.RawString.QQ
import Text.Trifecta


-- Example string to test our header parser
headerEx :: String
headerEx = "[blah]"

newtype Header =
  Header String deriving (Eq, Ord, Show)

parseBracketPair :: Parser a -> Parser a
parseBracketPair p = char '[' *> p <* char ']'

parseHeader :: Parser Header
parseHeader = parseBracketPair (Header <$> some letter)

-- Example string to test our assignment parser
assignmentEx :: String
assignmentEx = "name=person"

type Name = String
type Value = String
type Assignments = Map Name Value

skipEOL :: Parser ()
skipEOL = skipMany (oneOf "\n")

parseAssignment :: Parser (Name, Value)
parseAssignment = do
  name <- some letter
  char '='
  value <- some letter
  skipEOL
  return (name, value)

-- Example string to test our comment parser
commentEx :: String
commentEx = "; comment on ini files looks like this"

-- Example string to test our assignment parser
commentEx' :: String
commentEx' = "; also; like this;"

skipComments :: Parser ()
skipComments = 
  skipMany (do
              char ';' <|> char '#'
              skipMany (noneOf "\n")
              skipEOL
            )

-- Example string to test our section parser
sectionEx :: String
sectionEx = [r|
; ignore me
[states]
donut=happy
|]

-- A slightly more complex section example. Stress that section.
sectionEx' :: String
sectionEx' = [r|
; example 2
[person]
name=A
sex=U

[school]
name=donbosco
principal=johnmulachira
|]

data Section = Section Header Assignments deriving (Eq, Show)

newtype Config =
  Config (Map Header Assignments) deriving (Eq, Show)

skipWhiteSpace :: Parser ()
skipWhiteSpace = skipMany (char ' ' <|> char '\n')


parseSection :: Parser Section
parseSection = do
  skipWhiteSpace
  skipComments
  h <- parseHeader
  skipEOL
  as <- some parseAssignment
  return $ Section h (M.fromList as)


rollup :: Section -> Map Header Assignments -> Map Header Assignments
rollup (Section h a) m = M.insert h a m

parseIni :: Parser Config
parseIni = do
  sections <- some parseSection
  let mapOfSections = foldr rollup M.empty sections
  return (Config mapOfSections)

maybeSuccess :: Result a -> Maybe a
maybeSuccess (Success a) = Just a
maybeSuccess _ = Nothing

-- We can go ahead and test all the above parsers in ghci/repl
-- with the given example strings or any other strings which constitutes a valid
-- ini file
-- But we can also test the whole thing by writing tests using the example strings
-- The tests, of course, are also persistent and can be run later to verify a 
-- refactoring or other changes
main :: IO ()
main = hspec $ do
  describe "Assignment pairings" $
    it "can parse a simple assignment" $ do
      let m = parseString parseAssignment mempty assignmentEx
          r' = maybeSuccess m
      print m
      r' `shouldBe` Just ("name", "person")

  describe "Header Parsing" $
    it "can parse a simple header" $ do
      let m = parseString parseHeader mempty headerEx
          r' = maybeSuccess m
      print m
      r' `shouldBe` Just (Header "blah")

  describe "Comment parsing" $
    it "can parse a simple comment" $ do
      let p = skipComments >> parseHeader
          i = "; woot\n[blah]"
          m = parseString p mempty i
          r' = maybeSuccess m
      print m
      r' `shouldBe` Just (Header "blah")

  describe "Section parsing" $
    it "can parse a section" $ do
      let m = parseString parseSection mempty sectionEx
          r' = maybeSuccess m
          states = M.fromList [("donut", "happy")]
          expected = Just (Section (Header "states") states)
      print m
      r' `shouldBe` expected

  describe "INI parsing" $
    it "can parse multiple sections in an .ini file" $ do
      let m = parseString parseIni mempty sectionEx'
          r' = maybeSuccess m
          personSection = M.fromList [("name", "A"), ("sex", "U")]
          schoolSection = M.fromList [("name", "donbosco"), ("principal", "johnmulachira")]
          expected =
            Just $ Config $ M.fromList [(Header "person", personSection), (Header "school", schoolSection)]
      r' `shouldBe` expected

