module Handsontable.Options.NumericFormat where

import Data.Options (Option, Options, opt, options)
import Foreign (Foreign)
import Prelude.Unicode ((∘))

newtype NumericFormatOptions = NumericFormatOptions Foreign

foreign import data NumericFormatOption ∷ Type

numericFormat ∷ Options NumericFormatOption → NumericFormatOptions
numericFormat = NumericFormatOptions ∘ options

pattern ∷ Option NumericFormatOption String
pattern = opt "pattern"

culture ∷ Option NumericFormatOption String
culture = opt "culture"
