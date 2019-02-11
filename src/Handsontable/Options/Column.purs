module Handsontable.Options.Column where

import Prelude.Unicode

import Handsontable.Options.Class (class IsColumnOption, class IsSharedOption)
import Handsontable.Options.NumericFormat (NumericFormatOptions)
import Data.Options (Option, Options, opt, options)
import Foreign (Foreign)

newtype ColumnOptions = ColumnOptions Foreign

foreign import data ColumnOption ∷ Type

instance columnSharedOptions ∷ IsSharedOption ColumnOption
instance columnOptions ∷ IsColumnOption ColumnOption

column ∷ Options ColumnOption → ColumnOptions
column = ColumnOptions ∘ options

field ∷ Option ColumnOption String
field = opt "data"

-- | Defines the column header name.
title ∷ Option ColumnOption String
title = opt "title"

-- | Defines data source for Autocomplete or Dropdown cell types.
source ∷ ∀ a. Option ColumnOption (Array a)
source = opt "source"

numericFormat ∷ Option ColumnOption NumericFormatOptions
numericFormat = opt "numericFormat"
