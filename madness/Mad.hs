module Mad where

import Data.Monoid

type Verb = String
type Adjective = String
type Noun = String
type Adverb = String
type Exclamation = String

madlibbin' :: Exclamation
           -> Adverb
           -> Noun
           -> Adjective
           -> String
madlibbin' ex adv noun adj = 
    mconcat [ex, "! he said ", adv, " as he jumped into his car ", noun, " and drove off with his ", ad, " wife."]
