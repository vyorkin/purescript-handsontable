module Handsontable.Options.Validator
  ( Validator(..)
  , validator
  ) where

import Prelude

import Handsontable.Options.Column (ColumnOption)
import Data.Options (Option, opt)

data Validator
  = Autocomplete
  | Date
  | Numeric
  | Time
  | Custom String

instance showValidator ∷ Show Validator where
  show = case _ of
    Autocomplete  → "autocomplete"
    Date          → "date"
    Numeric       → "numeric"
    Time          → "time"
    (Custom name) → name

validator ∷ Option ColumnOption Validator
validator = opt "validator"
