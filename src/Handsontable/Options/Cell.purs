module Handsontable.Options.Cell
  ( Options(..)
  , Option
  , Cell(..)
  , cell
  , options
  , row
  , col
  ) where

import Prelude
import Prelude.Unicode ((∘))
import Handsontable.Options.Class (class IsCellOption, class IsSharedOption)
import Handsontable.Options.Common (SharedOption)
import Data.Functor.Contravariant (cmap)
import Data.Options (opt)
import Data.Options as O
import Foreign (Foreign)

newtype Options = Options Foreign

foreign import data Option ∷ Type
instance optionIsSharedOption ∷ IsSharedOption Option
instance optionIsCellOption ∷ IsCellOption Option

-- | Shortcut to define the combination of
-- | the cell renderer, editor and validator for
-- | the column, cell or whole table.
data Cell
  = Autocomplete
  | Checkbox
  | Date
  | Dropdown
  | Handsontable
  | Numeric
  | Password
  | Text
  | Time

instance showCell ∷ Show Cell where
  show = case _ of
    Autocomplete → "autocomplete"
    Checkbox     → "checkbox"
    Date         → "date"
    Dropdown     → "dropdown"
    Handsontable → "handsontable"
    Numeric      → "numeric"
    Password     → "password"
    Text         → "text"
    Time         → "time"

-- | Shortcut to define the combination of the cell renderer,
-- | editor and validator for the column, cell or whole table.
cell ∷ SharedOption Cell
cell = cmap show (opt "cell")

-- | Makes possible to specify cell overrides.
options ∷ O.Options Option → Options
options = Options ∘ O.options

-- | Row index.
row ∷ O.Option Option Int
row = opt "row"

-- | Column index.
col ∷ O.Option Option Int
col = opt "col"
