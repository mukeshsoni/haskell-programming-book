{-# LANGUAGE QuasiQuotes #-}
module AltParsing where

import Control.Applicative
import Text.RawString.QQ
import Text.Trifecta

type NumberOrString =
    Either Integer String

eitherOr = [r|
123
def
456
ghi
|]

parseNos :: Parser NumberOrString
parseNos =
    skipMany (oneOf "\n")
    >>
    (Left <$> integer)
    <|> (Right <$> some letter)

main = do
    print $ parseString parseNos mempty eitherOr
    print $ parseString (some (token parseNos)) mempty eitherOr